import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulse_tracker/core/ui/ui_constants.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/pages/record_page.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/common_widgets/record_list_tile.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/history/history_widget.dart';

import '../../../data/models/record_model.dart';
import '../../pages/history_page.dart';

class MainWidget extends StatelessWidget {
  MainWidget({super.key});

  final recordList = List.generate(
    3,
    (index) {
      return RecordModel(
        dateTime: DateTime.now(),
        systolic: 120,
        diastolic: 80,
        pulse: 60,
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Pressure BPM Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...List.generate(
              recordList.length,
              (index) => RecordListTile(record: recordList[index]),
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
                      builder: (context) => HistoryPage(recordList: recordList),
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
      ),
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
  }
}
