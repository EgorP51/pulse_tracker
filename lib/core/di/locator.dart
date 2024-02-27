import 'package:get_it/get_it.dart';
import 'package:pulse_tracker/features/pulse_tracker/manager/pulse_tracker_bloc.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<PulseTrackerBloc>(PulseTrackerBloc());
}
