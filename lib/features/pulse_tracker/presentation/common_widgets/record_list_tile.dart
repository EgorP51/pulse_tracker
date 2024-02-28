import 'package:flutter/material.dart';
import 'package:pulse_tracker/core/ui/ui_constants.dart';
import 'package:pulse_tracker/core/utils/date_time_utils.dart';
import 'package:pulse_tracker/features/pulse_tracker/data/models/record_model.dart';

class RecordListTile extends StatelessWidget {
  final RecordModel record;

  const RecordListTile({
    required this.record,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(UIConstants.radius),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  record.systolic.toString(),
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  record.diastolic.toString(),
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 5,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF65A471),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateTimeUtils.formatDateTime(record.dateTime!),
                  style: TextStyle(fontSize: 19, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pulse: ${record.pulse} BPM',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
