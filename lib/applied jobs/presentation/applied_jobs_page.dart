import 'package:flutter/material.dart';
import 'package:grinder/applied%20jobs/widgets/toggle_buttons.dart';
import 'package:grinder/constants/data.dart';

class AppliedJobsPage extends StatefulWidget {
  const AppliedJobsPage({super.key});

  @override
  State<AppliedJobsPage> createState() => _AppliedJobsPageState();
}

class _AppliedJobsPageState extends State<AppliedJobsPage> {
  int selectedServiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //  final filteredStations = _filterServiceStations();
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Applied\nJobs",
                style: theme.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "See your applied jobs here.",
                style: TextStyle(color: Colors.grey),
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
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var job = data[index];
                    return job;
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
