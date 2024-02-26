part of 'pulse_tracker_bloc.dart';

abstract class PulseTrackerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialEvent extends PulseTrackerEvent {}

class SaveRecordEvent extends PulseTrackerEvent {
  final RecordModel record;

  SaveRecordEvent({required this.record});

  @override
  List<Object?> get props => [record];
}
