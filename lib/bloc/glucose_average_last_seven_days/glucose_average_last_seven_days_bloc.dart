
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/glucose_level_last_seven_days/glucose_level_for_past_seven_days.dart';
import '../../repository/diabetes/diabetes_repository.dart';

part 'glucose_average_last_seven_days_event.dart';
part 'glucose_average_last_seven_days_state.dart';

class GlucoseAverageLastSevenDaysBloc extends Bloc<GlucoseAverageLastSevenDaysEvent,GlucoseAverageLastSevenDaysState>{
  final DiabetesRepository repository;

  GlucoseAverageLastSevenDaysBloc({required this.repository}) : super(const GlucoseAverageLastSevenDaysState()){
    on<GetGlucoseAverageLastSevenDaysFromApi>(_onGettingGlucoseAverage);
    on<RefreshGlucoseAverageLastSevenDays>(_onRefreshingGlucoseAverage);
  }

  FutureOr<void> _onGettingGlucoseAverage(GetGlucoseAverageLastSevenDaysFromApi event, Emitter<GlucoseAverageLastSevenDaysState> emit) async {
    emit(state.copyWith(status: GlucoseAverageLastSevenDaysStatus.loading));

    try{

      final glucoseLevel  = await repository.getBloodGlucoseOfLast7Days();

      glucoseLevel.fold(
            (failure) => emit(state.copyWith(
            status: GlucoseAverageLastSevenDaysStatus.failure, errorMessage: failure.message)),
            (response) => emit( state.copyWith(
            status: GlucoseAverageLastSevenDaysStatus.success, glucoseLevelForPastSevenDays: response)),
      );

    }catch (e) {
      emit(state.copyWith(
          status: GlucoseAverageLastSevenDaysStatus.failure, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onRefreshingGlucoseAverage(RefreshGlucoseAverageLastSevenDays event, Emitter<GlucoseAverageLastSevenDaysState> emit) async {
    emit(state.copyWith(status: GlucoseAverageLastSevenDaysStatus.refreshing));

    try{

      final glucoseLevel  = await repository.getBloodGlucoseOfLast7Days();

      glucoseLevel.fold(
            (failure) => emit(state.copyWith(
            status: GlucoseAverageLastSevenDaysStatus.failure, errorMessage: failure.message)),
            (response) => emit( state.copyWith(
            status: GlucoseAverageLastSevenDaysStatus.success, glucoseLevelForPastSevenDays: response)),
      );

    }catch (e) {
      emit(state.copyWith(
          status: GlucoseAverageLastSevenDaysStatus.failure, errorMessage: e.toString()));
    }
  }
}