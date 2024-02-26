part of 'pulse_tracker_bloc.dart';

abstract class PulseTrackerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialEvent extends PulseTrackerEvent {}
