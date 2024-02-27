import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_tracker/core/di/locator.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/main/main_widget.dart';

import '../../manager/pulse_tracker_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PulseTrackerBloc>(
      create: (context) => locator.get<PulseTrackerBloc>()..add(InitialEvent()),
      child: const MainWidget(),
    );
  }
}
