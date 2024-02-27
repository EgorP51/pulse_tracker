import 'package:flutter/material.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/history/history_widget.dart';

import '../../data/models/record_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    required this.recordList,
    super.key,
  });

  final List<RecordModel> recordList;

  @override
  Widget build(BuildContext context) {
    return HistoryWidget(recordList: recordList);
  }
}
