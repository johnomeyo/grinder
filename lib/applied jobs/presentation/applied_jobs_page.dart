import 'package:flutter/material.dart';
import 'package:grinder/applied%20jobs/widgets/toggle_buttons.dart';
import 'package:grinder/constants/data.dart';
import 'package:grinder/applied%20jobs/widgets/job_card.dart';
import 'package:grinder/models/job_model.dart';

class AppliedJobsPage extends StatefulWidget {
  const AppliedJobsPage({super.key});

  @override
  State<AppliedJobsPage> createState() => _AppliedJobsPageState();
}

class _AppliedJobsPageState extends State<AppliedJobsPage> {
  int selectedServiceIndex = 0;

  // List of filter options (must match toggle button list)
  final List<String> services = ["All", "Interviewing", "Accepted", "Rejected"];

  // Method to filter jobs based on selected category
  List<Job> _getFilteredJobs() {
    if (selectedServiceIndex == 0) {
      return data; // Return all jobs if "All" is selected
    }

    // Filter jobs based on selected status
    return data
        .where((job) => job.jobStatus == services[selectedServiceIndex])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Job> filteredJobs = _getFilteredJobs(); // Get filtered job list

    return Scaffold(
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
                            company: job.companyName,
                            position: job.position,
                            date: "",
                            location: job.jobLocation,
                            jobType: job.jobType,
                            status: job.jobStatus); // Show filtered job cards
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
