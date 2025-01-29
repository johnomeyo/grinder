import 'package:flutter/material.dart';

class JobListWidget extends StatelessWidget {
  const JobListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> jobs = ["Software Engineer", "Data Analyst", "UI/UX Designer"];

    return jobs.isEmpty
        ? Center(child: Text("No jobs added yet. Start tracking now!"))
        : ListView.separated(
            itemCount: jobs.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(jobs[index], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Company ABC - Remote"),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              );
            },
          );
  }
}
