part of 'pulse_tracker_bloc.dart';

class PulseTrackerState extends Equatable {
  const PulseTrackerState({this.records = const []});

  final List<RecordModel> records;

  PulseTrackerState copyWith({
    List<RecordModel>? records,
  }) {
    return PulseTrackerState(
      records: records ?? this.records,
    );
  }

  @override
  List<Object?> get props => [records];
}
