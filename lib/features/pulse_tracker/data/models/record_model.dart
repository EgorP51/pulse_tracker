import 'dart:convert';

import 'package:hive/hive.dart';

part 'record_model.g.dart';

RecordModel recordModelFromJson(String str) {
  return RecordModel.fromJson(json.decode(str));
}

String recordModelToJson(RecordModel data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class RecordModel {
  @HiveField(0)
  final int? systolic;
  @HiveField(1)
  final int? diastolic;
  @HiveField(2)
  final int? pulse;
  @HiveField(3)
  final DateTime? dateTime;

  RecordModel({
    this.systolic,
    this.diastolic,
    this.pulse,
    this.dateTime,
  });

  RecordModel copyWith({
    int? systolic,
    int? diastolic,
    int? pulse,
    DateTime? dateTime,
  }) =>
      RecordModel(
        systolic: systolic ?? this.systolic,
        diastolic: diastolic ?? this.diastolic,
        pulse: pulse ?? this.pulse,
        dateTime: dateTime ?? this.dateTime,
      );

  factory RecordModel.fromJson(Map<String, dynamic> json) => RecordModel(
        systolic: json["systolic"],
        diastolic: json["diastolic"],
        pulse: json["pulse"],
        dateTime:
            json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "systolic": systolic,
        "diastolic": diastolic,
        "pulse": pulse,
        "dateTime": dateTime?.toIso8601String(),
      };

  @override
  String toString() {
    return 'RecordModel(systolic: $systolic, diastolic: $diastolic, pulse: $pulse, dateTime: $dateTime)';
  }
}
