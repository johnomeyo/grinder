import 'package:flutter/material.dart';
import 'package:grinder/homepage/presentation/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({super.key});
  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'hasSeenOnboarding', true); // Mark onboarding as completed
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const Homescreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: () => _completeOnboarding(context),
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
