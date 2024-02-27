import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_tracker/features/pulse_tracker/manager/pulse_tracker_bloc.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/pages/record_page.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/main/empty_body.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/main/main_body.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PulseTrackerBloc, PulseTrackerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Blood Pressure BPM Tracker'),
          ),
          body: state.records.isEmpty
              ? const EmptyBody()
              : MainBody(state: state),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecordPage(),
                ),
              );
            },
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        );
      },
    );
  }
}
