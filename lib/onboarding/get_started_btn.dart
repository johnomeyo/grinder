import 'package:flutter/material.dart';
import 'package:grinder/homepage/presentation/homescreen.dart';

class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Homescreen()));
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 15,
            ),
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: const Text('Get Started'),
        ),
      ),
    );
  }
}