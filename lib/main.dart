import 'package:flutter/material.dart';
// import 'package:grinder/homepage.dart';
import 'package:grinder/homepage/presentation/homescreen.dart';
import 'theme.dart'; // Import the theme file

void main() {
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
     theme: brightness == Brightness.dark ? theme.dark() : theme.light(), // Set dark theme
      themeMode: ThemeMode.system, // Automatically switch based on the system theme
      home: Homescreen(),
    );
  }
}
