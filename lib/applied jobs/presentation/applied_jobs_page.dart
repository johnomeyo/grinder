import 'package:flutter/material.dart';
import 'package:grinder/constants/data.dart';

class AppliedJobsPage extends StatelessWidget {
  const AppliedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Applied Jobs")),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            var job = data[index];
            return job;
          }),
    );
  }
}
