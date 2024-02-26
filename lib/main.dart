import 'package:flutter/material.dart';
import 'package:pulse_tracker/core/ui/theme.dart';
import 'features/pulse_tracker/presentation/pages/record_page.dart';

// start: 30h

void main() {
  runApp(const PulseTrackerApp());
}

class PulseTrackerApp extends StatelessWidget {
  const PulseTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PulseTrackerTheme.theme,
      home: const RecordPage(),
    );
  }
}
