import 'package:flutter/material.dart';
import 'package:grinder/applied%20jobs/widgets/job_card.dart';
import 'package:grinder/homepage/widgets/bar_chart.dart';
import 'package:grinder/homepage/widgets/line_chart.dart';
import 'package:grinder/homepage/widgets/pie_chart.dart';
import 'package:grinder/homepage/widgets/statistics_widget.dart';
import 'package:grinder/homepage/widgets/text_header.dart';
import '../widgets/header_widget.dart';
import '../widgets/add_job_button.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20,
                  children: [
                    const HeaderWidget(),
                    StatisticsWidget(),
                    TextHeader(text: "Recently Applied"),
                    JobCard(
                      company: 'Lumis Softwares',
                      position: 'Flutter Developer',
                      date: 'July 17, 2024',
                      location: 'Remote',
                      jobType: 'Full-time',
                      status: 'Applied',
                      onEdit: () {},
                    ),
                    TextHeader(text: "Application Outcomes"),
                    ApplicationStatsChart(),
                    TextHeader(text: "Average Response Time"),
                    ResponseTimeChart(),
                    TextHeader(text: "Job Application Breakdown"),
                    ApplicationPieChart()
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: const AddJobButton(),
    );
  }
}
