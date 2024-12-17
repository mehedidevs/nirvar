import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';
import '../../models/blood_pressure_last_seven_days/blood_pressure_history_for_last_7_days.dart';

part 'blood_pressure_average_last_seven_days_event.dart';
part 'blood_pressure_average_last_seven_days_state.dart';

class BloodPressureAverageLastSevenDaysBloc extends Bloc<BloodPressureAverageLastSevenDaysEvent, BloodPressureAverageLastSevenDaysState> {
  final BloodPressureRepository repository;

  BloodPressureAverageLastSevenDaysBloc({required this.repository})
      : super(const BloodPressureAverageLastSevenDaysState()) {
    on<GetBloodPressureAverageLastSevenDaysFromApi>(_onGettingBloodPressureAverage);
    on<RefreshBloodPressureAverageLastSevenDays>(_onRefreshingBloodPressureAverage);
  }

  Future<void> _fetchBloodPressureAverage(
      Emitter<BloodPressureAverageLastSevenDaysState> emit,
      BloodPressureAverageLastSevenDaysStatus status) async {
    emit(state.copyWith(status: status));

    try {
      final result = await repository.getBloodPressureOfLast7Days();
      result.fold(
            (failure) => emit(state.copyWith(
            status: BloodPressureAverageLastSevenDaysStatus.failure,
            errorMessage: failure.message)),
            (response) => emit(state.copyWith(
            status: BloodPressureAverageLastSevenDaysStatus.success,
            bloodPressureHistoryForLast7Days: response)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: BloodPressureAverageLastSevenDaysStatus.failure,
          errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onGettingBloodPressureAverage(
      GetBloodPressureAverageLastSevenDaysFromApi event,
      Emitter<BloodPressureAverageLastSevenDaysState> emit) {
    return _fetchBloodPressureAverage(
        emit, BloodPressureAverageLastSevenDaysStatus.loading);
  }

  FutureOr<void> _onRefreshingBloodPressureAverage(
      RefreshBloodPressureAverageLastSevenDays event,
      Emitter<BloodPressureAverageLastSevenDaysState> emit) {
    return _fetchBloodPressureAverage(
        emit, BloodPressureAverageLastSevenDaysStatus.refreshing);
  }
}
