import 'package:flutter/material.dart';
import 'package:grinder/add%20job/presentation/add_job_page.dart';

class AddJobButton extends StatelessWidget {
  const AddJobButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddJobPage()));
      },
      icon: Icon(Icons.add),
      label: Text("Add Job"),
    );
  }
}
