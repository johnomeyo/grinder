import 'package:flutter/material.dart';
import 'package:grinder/homepage/widgets/empty_section_card.dart';
import 'package:grinder/homepage/widgets/recently_applied_section.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  const HeaderWidget(),
                  StatisticsWidget(),
                  TextHeader(text: "Recently Applied"),
                  // RecentlyAppliedSection(),
                  EmptySectionCard(),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: const AddJobButton(),
    );
  }
}
