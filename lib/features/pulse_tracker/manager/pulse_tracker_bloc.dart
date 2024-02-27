import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/models/record_model.dart';

part 'pulse_tracker_event.dart';

part 'pulse_tracker_state.dart';

class PulseTrackerBloc extends Bloc<PulseTrackerEvent, PulseTrackerState> {
  late final Box<RecordModel> recordBox;

  PulseTrackerBloc() : super(const PulseTrackerState()) {
    on<InitialEvent>((event, emit) async {
      recordBox = await Hive.openBox<RecordModel>('records');
      List<RecordModel> records = recordBox.values.toList();

      emit(state.copyWith(records: records));
    });
    on<SaveRecordEvent>((event, emit) {
      recordBox.add(event.record);
      List<RecordModel> newRecords = recordBox.values.toList();
      emit(state.copyWith(records: newRecords));
    });
  }
}
