import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pulse_tracker/core/ui/theme.dart';
import 'package:pulse_tracker/features/pulse_tracker/data/models/record_model.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/pages/main_page.dart';

import 'core/di/locator.dart';

// start: 30h

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  setup();
  runApp(const PulseTrackerApp());
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<RecordModel>(RecordModelAdapter());
}

class PulseTrackerApp extends StatelessWidget {
  const PulseTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PulseTrackerTheme.theme,
      home: const MainPage(),
    );
  }
}
