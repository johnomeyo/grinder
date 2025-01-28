import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current theme's brightness (light/dark mode)
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Tracker'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Illustration or Placeholder Icon
              Icon(
                Icons.work_outline,
                size: 100,
                color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              ),

              const SizedBox(height: 24),

              // Informative Text
              Text(
                'No Job Applications Yet',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Text(
                'Track your job applications by adding them here.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Add Job Button
              ElevatedButton.icon(
                onPressed: () {
                  // Navigate to add job page or show a modal
                  // Implement the navigation logic here
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Job Application'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
