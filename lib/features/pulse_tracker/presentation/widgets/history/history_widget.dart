import 'package:flutter/material.dart';

import '../../../data/models/record_model.dart';
import '../../common_widgets/record_list_tile.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
    required this.recordList,
  });

  final List<RecordModel> recordList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...List.generate(
              recordList.length,
              (index) => RecordListTile(record: recordList[index]),
            ),
          ],
        ),
      ),
    );
  }
}
