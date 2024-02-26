import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDate(DateTime? date) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(date ?? DateTime(2000));
  }

  static String formatTime(TimeOfDay? time) {
    String formattedTime =
        '${time?.hour}:${time?.minute.toString().padLeft(2, '0')}';
    return formattedTime;
  }
}
