import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_tracker/core/ui/ui_constants.dart';
import 'package:pulse_tracker/features/pulse_tracker/manager/pulse_tracker_bloc.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/pages/record_page.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/common_widgets/record_list_tile.dart';

import '../../pages/history_page.dart';

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

class MainBody extends StatelessWidget {
  const MainBody({super.key, required this.state});

  final PulseTrackerState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ...List.generate(
            state.records.length,
            (index) => RecordListTile(record: state.records[index]),
          ),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(UIConstants.radius),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HistoryPage(recordList: state.records);
                    },
                  ),
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.history, color: Colors.black, size: 30),
                  SizedBox(width: 6),
                  Text(
                    'All History',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmptyBody extends StatelessWidget {
  const EmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No records yet',
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.grey,
            ),
      ),
    );
  }
}
