import 'package:flutter/material.dart';
import 'package:grinder/applied%20jobs/widgets/job_card.dart';

class RecentlyAppliedSection extends StatelessWidget {
  const RecentlyAppliedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160, // Give it a fixed height so cards render properly
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enables horizontal scrolling
        child: Row(
          children: [
            JobCard(
              company: 'Lumis Softwares',
              position: 'Flutter Developer',
              date: 'July 17, 2024',
              location: 'Remote',
              jobType: 'Full-time',
              status: 'Applied',
              onEdit: () {},
            ),
            SizedBox(width: 12), 
            JobCard(
              company: 'Lumis Softwares',
              position: 'Flutter Developer',
              date: 'July 17, 2024',
              location: 'Remote',
              jobType: 'Full-time',
              status: 'Applied',
              onEdit: () {},
            ),
          ],
        ),
      ),
    );
  }
}
