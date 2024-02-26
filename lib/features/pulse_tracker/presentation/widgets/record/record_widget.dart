import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulse_tracker/core/ui/ui_constants.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/record/custom_date_time_picker.dart';
import 'package:pulse_tracker/features/pulse_tracker/presentation/widgets/record/custom_number_picker.dart';

class RecordWidget extends StatelessWidget {
  const RecordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Record')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // DATA INPUT
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomNumberPicker(type: NumberPickerType.systolic),
                SizedBox(width: 10),
                CustomNumberPicker(type: NumberPickerType.diastolic),
                SizedBox(width: 10),
                CustomNumberPicker(type: NumberPickerType.pulse),
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
            const CustomDateTimePicker(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoButton(
          borderRadius: BorderRadius.circular(UIConstants.radius),
          color: Theme.of(context).colorScheme.primary,
          child: const Text('save'),
          onPressed: () {},
        ),
      ),
    );
  }
}
