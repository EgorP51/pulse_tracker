import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_tracker/core/ui/ui_constants.dart';
import 'package:pulse_tracker/features/pulse_tracker/data/models/record_model.dart';
import 'package:pulse_tracker/features/pulse_tracker/manager/pulse_tracker_bloc.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/record/custom_date_time_picker.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/record/custom_number_picker.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget({super.key});

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  late RecordModel record;

  @override
  void initState() {
    record = RecordModel();
    super.initState();
  }

  void onValueSelected(int value, NumberPickerType type) {
    switch (type) {
      case NumberPickerType.systolic:
        record = record.copyWith(systolic: value);
        break;
      case NumberPickerType.diastolic:
        record = record.copyWith(diastolic: value);
        break;
      case NumberPickerType.pulse:
        record = record.copyWith(pulse: value);
        break;
    }
  }

  void onDateSelected(DateTime value) {
    record = record.copyWith(dateTime: value);
  }

  onTimeSelected(TimeOfDay value) {
    record = record.copyWith(
        dateTime: DateTime(
      record.dateTime!.year,
      record.dateTime!.month,
      record.dateTime!.day,
      value.hour,
      value.minute,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PulseTrackerBloc, PulseTrackerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('New Record')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // DATA INPUT
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomNumberPicker(
                      type: NumberPickerType.systolic,
                      onValueSelected: onValueSelected,
                    ),
                    const SizedBox(width: 10),
                    CustomNumberPicker(
                      type: NumberPickerType.diastolic,
                      onValueSelected: onValueSelected,
                    ),
                    const SizedBox(width: 10),
                    CustomNumberPicker(
                      type: NumberPickerType.pulse,
                      onValueSelected: onValueSelected,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // TEXT
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Date & Time',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                // DATE INPUT
                CustomDateTimePicker(
                  onDateSelected: onDateSelected,
                  onTimeSelected: onTimeSelected,
                ),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(UIConstants.radius),
              color: Theme.of(context).colorScheme.primary,
              child: const Text('save'),
              onPressed: () {
                BlocProvider.of<PulseTrackerBloc>(context).add(
                  SaveRecordEvent(record: record),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
