import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulse_tracker/core/ui/ui_constants.dart';
import 'package:pulse_tracker/features/pulse_tracker/manager/pulse_tracker_bloc.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/pages/history_page.dart';

class AllHistoryButton extends StatelessWidget {
  const AllHistoryButton({super.key, required this.state});

  final PulseTrackerState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(UIConstants.radius),
        color: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HistoryPage(recordList: state.records.reversed.toList());
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
    );
  }
}
