import 'package:flutter/material.dart';

class AppliedJobsPage extends StatelessWidget {
  const AppliedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Applied Jobs")),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [Text("Welcome")],
              ),
            );
          }),
    );
  }
}
