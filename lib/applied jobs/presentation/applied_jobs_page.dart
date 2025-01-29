import 'package:flutter/material.dart';
import 'package:grinder/applied%20jobs/widgets/job_card.dart';

class AppliedJobsPage extends StatelessWidget {
  const AppliedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Applied Jobs")),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return JobCard(
              company: 'Lumis Softwares',
              position: 'Flutter Developer',
              date: 'July 17, 2024',
              location: 'Remote',
              jobType: 'Full-time',
              status: 'Applied',
              onEdit: (){},
            );
          }),
    );
  }
}
