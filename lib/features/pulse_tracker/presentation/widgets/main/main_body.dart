import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulse_tracker/features/pulse_tracker/manager/pulse_tracker_bloc.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/common_widgets/record_list_tile.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/main/all_history_button.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key, required this.state});

  final PulseTrackerState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          if (state.records.length > 2) ...[
            RecordListTile(record: state.records[state.records.length - 1]),
            RecordListTile(record: state.records[state.records.length - 2]),
            RecordListTile(record: state.records[state.records.length - 3]),
          ] else
            ...List.generate(
              state.records.length,
              (index) => RecordListTile(record: state.records[index]),
            ),
          AllHistoryButton(state: state),
        ],
      ),
    );
  }
}
