import 'package:flutter/material.dart';
import 'package:pulse_tracker/core/ui/ui_constants.dart';
import 'package:pulse_tracker/core/utils/date_time_utils.dart';

class CustomDateTimePicker extends StatefulWidget {
  const CustomDateTimePicker({
    this.onDateSelected,
    this.onTimeSelected,
    super.key,
  });

  final Function(DateTime date)? onDateSelected;
  final Function(TimeOfDay date)? onTimeSelected;

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  var currentDate = DateTime.now();
  var currentTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(UIConstants.radius),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2025),
              ).then((value) {
                setState(() {
                  currentDate = value ?? currentDate;
                  widget.onDateSelected?.call(currentDate);
                });
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2 - 24 ,
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(UIConstants.radius),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 6),
                  Text(
                    DateTimeUtils.formatDate(currentDate),
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(UIConstants.radius),
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  setState(() {
                    currentTime = value ?? currentTime;
                    widget.onTimeSelected?.call(currentTime);
                  });
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(UIConstants.radius),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 6),
                    Text(
                      DateTimeUtils.formatTime(currentTime),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
