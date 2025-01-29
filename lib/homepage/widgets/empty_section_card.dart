import 'package:flutter/material.dart';

class EmptySectionCard extends StatelessWidget {
  const EmptySectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: SizedBox(
        height: size.height * 0.3,
        width: double.infinity,
        child: Column(
          children: [Text("This is where your recently applied jobs will be")],
        ),
      ),
    );
  }
}
