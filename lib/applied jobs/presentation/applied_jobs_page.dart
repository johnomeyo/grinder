import 'package:flutter/material.dart';
import 'package:grinder/applied%20jobs/widgets/toggle_buttons.dart';
import 'package:grinder/constants/data.dart';
import 'package:grinder/applied%20jobs/widgets/job_card.dart';
import 'package:grinder/models/job_model.dart';
import 'package:grinder/services/crud_services.dart';

class AppliedJobsPage extends StatefulWidget {
  const AppliedJobsPage({super.key});

  @override
  State<AppliedJobsPage> createState() => _AppliedJobsPageState();
}

class _AppliedJobsPageState extends State<AppliedJobsPage> {
  @override
  void initState() {
    super.initState();
    _loadJobs(); // Load jobs when the page opens
  }

  void _loadJobs() async {
    List<Job> jobs = CrudService().getAllJobs(); // Fetch latest data
    setState(() {
      data = jobs; // Update the `data` list
    });
      // Print jobs properly
  for (var job in data) {
    print(job.jobStatus);
  }
  }

  int selectedServiceIndex = 0;

  // List of filter options (must match toggle button list)
  final List<String> services = [
    "All",
    "Interviewing",
    "Accepted",
    "Rejected",
  ];

  // Method to filter jobs based on selected category
  List<Job> _getFilteredJobs() {
    List<Job> allJobs = data; // Fetch fresh data

    if (selectedServiceIndex == 0) {
      return allJobs; // Return all jobs if "All" is selected
    }

    return allJobs
        .where((job) => job.jobStatus == services[selectedServiceIndex])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Job> filteredJobs = _getFilteredJobs(); // Get filtered job list

    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Applied\nJobs",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "See your applied jobs here.",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            ServiceToggleButton(
              selectedIndex: selectedServiceIndex,
              onSelected: (int index) {
                setState(() {
                  selectedServiceIndex = index;
                });
              },
            ),
            Expanded(
                child: filteredJobs.isEmpty
                    ? const Center(child: Text("No jobs found."))
                    : ListView.builder(
                        itemCount: filteredJobs.length,
                        itemBuilder: (context, index) {
                          var job = filteredJobs[index];

                          return JobCard(
                            id: job.id, // Pass job ID
                            company: job.companyName,
                            position: job.position,
                            date: job.jobDate,
                            location: job.jobLocation,
                            jobType: job.jobType,
                            status: job.jobStatus,
                            onTap: () {
                              setState(() {
                                _loadJobs(); // Reload jobs after edit
                              });
                            },
                          );
                        },
                      )),
          ],
        ),
      ),
    );
  }
}
