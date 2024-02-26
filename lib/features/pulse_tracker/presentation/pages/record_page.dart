import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_tracker/features/pulse_tracker/manager/pulse_tracker_bloc.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/record/record_widget.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PulseTrackerBloc>(
        create: (context) => PulseTrackerBloc()..add(InitialEvent()),
        child: const RecordWidget());
  }
}
