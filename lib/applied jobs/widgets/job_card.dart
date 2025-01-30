import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String company;
  final String position;
  final String date;
  final String location;
  final String jobType;
  final String status;
  final VoidCallback? onEdit;
  final VoidCallback? onTap;

  const JobCard({
    super.key,
    required this.company,
    required this.position,
    required this.date,
    required this.location,
    required this.jobType,
    required this.status,
    this.onEdit,
    this.onTap,
  });

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
              Text(
                company,
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                position,
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 12),
              _buildDetailsRow(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the top row containing the avatar, job status, and edit button.
  Widget _buildHeader(ThemeData theme) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: theme.colorScheme.inversePrimary,
          child: Text(company[0].toUpperCase(),
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton.tonal(
                onPressed: () {}, // Can be modified to trigger a status change
                child: Text(status),
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit),
                tooltip: "Edit Job",
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the row containing job details (date, location, job type).
  Widget _buildDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconText(Icons.calendar_month, date),
        _buildIconText(Icons.location_on, location),
        _buildIconText(Icons.work_outline, jobType),
      ],
    );
  }

  /// Reusable method to build an icon + text row
  Widget _buildIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
      ],
    );
  }
}
