import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:pulse_tracker/core/ui/ui_constants.dart';

enum NumberPickerType { systolic, diastolic, pulse }

extension NumberPickerTypeExtension on NumberPickerType {
  String get name {
    switch (this) {
      case NumberPickerType.systolic:
        return 'Systolic';
      case NumberPickerType.diastolic:
        return 'Diastolic';
      case NumberPickerType.pulse:
        return 'Pulse';
    }
  }

  String get unitOfMeasurement {
    switch (this) {
      case NumberPickerType.systolic:
        return '(mmHg)';
      case NumberPickerType.diastolic:
        return '(mmHg)';
      case NumberPickerType.pulse:
        return '(BMP)';
    }
  }

  int get defaultValues {
    switch (this) {
      case NumberPickerType.systolic:
        return 120;
      case NumberPickerType.diastolic:
        return 80;
      case NumberPickerType.pulse:
        return 60;
    }
  }
}

class CustomNumberPicker extends StatefulWidget {
  const CustomNumberPicker({
    required this.type,
    this.onValueSelected,
    super.key,
  });

  final NumberPickerType type;
  final Function(int value, NumberPickerType type)? onValueSelected;

  @override
  State<CustomNumberPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  late int _value;

  @override
  void initState() {
    _value = widget.type.defaultValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          UIConstants.radius,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.type.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.type.unitOfMeasurement,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          NumberPicker(
            value: _value,
            minValue: 0,
            maxValue: 250,
            step: 1,
            itemHeight: 60,
            itemWidth: 80,
            axis: Axis.vertical,
            textStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            onChanged: (value) {
              setState(() {
                _value = value;
                widget.onValueSelected?.call(value, widget.type);
              });
            },
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Colors.grey[600]!,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
