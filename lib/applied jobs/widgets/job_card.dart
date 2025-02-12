import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hive/hive.dart';

class JobCard extends StatefulWidget {
  final String id;
  final String company;
  final String position;
  final DateTime date;
  final String location;
  final String jobType;
  final String status;
  final VoidCallback? onTap;

  const JobCard({
    super.key,
    required this.id,
    required this.company,
    required this.position,
    required this.date,
    required this.location,
    required this.jobType,
    required this.status,
    this.onTap,
  });

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  late String company;
  late String position;
  late DateTime date;
  late String location;
  late String jobType;
  late String status;

  final List<String> jobStatusOptions = ['Applied', 'Interviewing', 'Accepted', 'Rejected'];
  final List<String> jobTypeOptions = ['Full-time', 'Part-time', 'Contract', 'Internship'];

  @override
  void initState() {
    super.initState();
    company = widget.company;
    position = widget.position;
    date = widget.date;
    location = widget.location;
    jobType = widget.jobType;
    status = widget.status;
  }

  Future<void> _updateJobInHive() async {
    var box = await Hive.openBox('jobs');
    await box.put(widget.id, {
      'company': company,
      'position': position,
      'date': date.toIso8601String(),
      'location': location,
      'jobType': jobType,
      'status': status,
    });
  }

  void _showEditDialog() {
    TextEditingController companyController = TextEditingController(text: company);
    TextEditingController positionController = TextEditingController(text: position);
    TextEditingController locationController = TextEditingController(text: location);

    String selectedStatus = status;
    String selectedJobType = jobType;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Job Details"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: companyController, decoration: const InputDecoration(labelText: "Company")),
                TextField(controller: positionController, decoration: const InputDecoration(labelText: "Position")),
                TextField(controller: locationController, decoration: const InputDecoration(labelText: "Location")),
                DropdownButtonFormField<String>(
                  value: selectedJobType,
                  decoration: const InputDecoration(labelText: "Job Type"),
                  items: jobTypeOptions.map((type) {
                    return DropdownMenuItem(value: type, child: Text(type));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      selectedJobType = value;
                    }
                  },
                ),
                DropdownButtonFormField<String>(
                  value: selectedStatus,
                  decoration: const InputDecoration(labelText: "Status"),
                  items: jobStatusOptions.map((status) {
                    return DropdownMenuItem(value: status, child: Text(status));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      selectedStatus = value;
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  company = companyController.text;
                  position = positionController.text;
                  location = locationController.text;
                  jobType = selectedJobType;
                  status = selectedStatus;
                });
                await _updateJobInHive();
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(theme),
              const SizedBox(height: 12),
              Text(company, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              Text(position, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              const SizedBox(height: 12),
              _buildDetailsRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: theme.colorScheme.secondary,
          child: Text(company[0].toUpperCase(),
              style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton.tonal(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    status == 'Applied'
                        ? Colors.blue
                        : status == "Interviewing"
                            ? Colors.orangeAccent
                            : status == 'Rejected'
                                ? Colors.red
                                : status == "Accepted"
                                    ? Colors.green
                                    : Colors.grey,
                  ),
                ),
                child: Text(status),
              ),
              IconButton(
                onPressed: _showEditDialog,
                icon: const Icon(Icons.edit),
                tooltip: "Edit Job",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconText(Icons.calendar_month_outlined, DateFormat('MMMM d, y').format(date)),
        _buildIconText(Icons.location_on, location),
        _buildIconText(Icons.work_outline, jobType),
      ],
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}
