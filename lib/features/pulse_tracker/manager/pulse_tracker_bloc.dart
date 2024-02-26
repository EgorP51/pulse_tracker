import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pulse_tracker_event.dart';
part 'pulse_tracker_state.dart';

class PulseTrackerBloc extends Bloc<PulseTrackerEvent, PulseTrackerState> {
  PulseTrackerBloc() : super(const PulseTrackerState()) {
    on<InitialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
