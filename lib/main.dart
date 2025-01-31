import 'package:flutter/material.dart';
// import 'package:grinder/homepage.dart';
import 'package:grinder/homepage/presentation/homescreen.dart';
import 'package:grinder/models/job_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'theme.dart'; // Import the theme file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//Initialize hive
  await Hive.initFlutter();
//register the adapter
  Hive.registerAdapter(JobAdapter());
  // Open the box for storing jobs
  await Hive.openBox<Job>('jobsBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    TextTheme textTheme = Theme.of(context).textTheme;
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      theme: brightness == Brightness.dark
          ? theme.dark()
          : theme.light(), // Set dark theme
      themeMode:
          ThemeMode.system, // Automatically switch based on the system theme
      home: Homescreen(),
    );
  }
}
