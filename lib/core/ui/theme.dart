import 'package:flutter/material.dart';

class PulseTrackerTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: Colors.grey,
      hintColor: Colors.green[900],
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
