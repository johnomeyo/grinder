import 'package:flutter/material.dart';
// import 'package:grinder/applied%20jobs/widgets/job_card.dart';
import 'package:grinder/homepage/widgets/bar_chart.dart';
import 'package:grinder/homepage/widgets/line_chart.dart';
import 'package:grinder/homepage/widgets/statistics_widget.dart';
import 'package:grinder/homepage/widgets/text_header.dart';
import 'package:grinder/services/notification_services.dart';
import '../widgets/header_widget.dart';
// import '../widgets/add_job_button.dart';

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
                    TextHeader(text: "Application Outcomes"),
                    ApplicationStatsChart(),
                    TextHeader(text: "Average Response Time"),
                    ResponseTimeChart(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NotificationService().showNotification(
              title: "Hello",
              body:
                  "Small steps lead to big opportunities—keep pushing forward!");

                  print("Clicked the show notifications button");
        },
        child: Text("Show notification"),
      ),
      // floatingActionButton: const AddJobButton(),
    );
  }
}
