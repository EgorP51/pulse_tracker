import 'package:flutter/material.dart';

class PulseTrackerTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey[200],
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleLarge: TextStyle(fontSize: 26.0, fontStyle: FontStyle.italic),
        bodyMedium: TextStyle(fontSize: 14.0),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: const Color(0xFF007F69),
      ),
    );
  }
}
