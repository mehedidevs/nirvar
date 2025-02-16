
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/blood_pressure/blood_pressure_repository.dart';

import '../../screens/utils/blood_pressure_utils.dart';

part 'blood_pressure_average_daily_event.dart';
part 'blood_pressure_average_daily_state.dart';

class BloodPressureAverageDailyBloc extends Bloc<BloodPressureAverageDailyEvent,BloodPressureAverageDailyState>{
  final BloodPressureRepository repository;

  BloodPressureAverageDailyBloc({required this.repository}) : super(const BloodPressureAverageDailyState()){
    on<GetBloodPressureAverageDailyFromApi>(_onGettingBloodPressureDailyAverageDaily);
    on<RefreshBloodPressureAverageDaily>(_onRefreshingBloodPressureDailyAverageDaily);
  }

  Future<void> _fetchBloodPressureAverage(
      Emitter<BloodPressureAverageDailyState> emit,
      BloodPressureAverageDailyStatus status) async {
    emit(state.copyWith(status: status));

    try {
      final result = await repository.getBloodPressureOfToday();
      result.fold(
            (failure) => emit(state.copyWith(
            status: BloodPressureAverageDailyStatus.failure,
            errorMessage: failure.message)),
            (response) {
              final average = BloodPressureUtils.calculateAverage(response);
              final systole = average['systolic'] == 0.0 ? 'N/A' : average['systolic']?.toStringAsFixed(0) ?? '';
              final diastole = average['diastolic'] == 0.0 ? '' : average['diastolic']?.toStringAsFixed(0) ?? '';
              emit(state.copyWith(status: BloodPressureAverageDailyStatus.success,systolic: systole,diastolic: diastole));
            }
      );
    } catch (e) {
      emit(state.copyWith(
          status: BloodPressureAverageDailyStatus.failure,
          errorMessage: e.toString()));
    }
  }


  FutureOr<void> _onGettingBloodPressureDailyAverageDaily(GetBloodPressureAverageDailyFromApi event, Emitter<BloodPressureAverageDailyState> emit) {
    return _fetchBloodPressureAverage(
        emit, BloodPressureAverageDailyStatus.loading);
  }

  FutureOr<void> _onRefreshingBloodPressureDailyAverageDaily(RefreshBloodPressureAverageDaily event, Emitter<BloodPressureAverageDailyState> emit) {
    return _fetchBloodPressureAverage(
        emit, BloodPressureAverageDailyStatus.refreshing);
  }
}