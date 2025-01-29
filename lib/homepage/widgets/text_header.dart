import 'package:flutter/material.dart';
import 'package:grinder/applied%20jobs/presentation/applied_jobs_page.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: theme.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AppliedJobsPage()));
        }, child: Text("See all"))
      ],
    );
  }
}
