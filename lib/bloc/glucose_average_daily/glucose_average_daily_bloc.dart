
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/diabetes/diabetes_repository.dart';

part 'glucose_average_daily_event.dart';
part 'glucose_average_daily_state.dart';

class GlucoseAverageDailyBloc extends Bloc<GlucoseAverageDailyEvent,GlucoseAverageDailyState>{
  final DiabetesRepository repository;
  GlucoseAverageDailyBloc({required this.repository}) : super(const GlucoseAverageDailyState()){
    on<GetGlucoseAverageDailyFromApi>(_onGettingGlucoseAverageDaily);
    on<RefreshGlucoseAverageDaily>(_onRefreshingGlucoseAverageDaily);
  }


  FutureOr<void> _onGettingGlucoseAverageDaily(GetGlucoseAverageDailyFromApi event, Emitter<GlucoseAverageDailyState> emit) async {
    emit(state.copyWith(status: GlucoseAverageDailyStatus.loading));

    try{

      final glucoseLevel  = await repository.getBloodGlucoseOfToday();

      glucoseLevel.fold(
            (failure) => emit(state.copyWith(
            status: GlucoseAverageDailyStatus.failure, errorMessage: failure.message)),
            (response) => emit( state.copyWith(
            status: GlucoseAverageDailyStatus.success, dailyGlucoseLevel: response)),
      );

    }catch(e){
      emit(state.copyWith(
          status: GlucoseAverageDailyStatus.failure, errorMessage: e.toString()));

    }
  }

  FutureOr<void> _onRefreshingGlucoseAverageDaily(RefreshGlucoseAverageDaily event, Emitter<GlucoseAverageDailyState> emit) async {
    emit(state.copyWith(status: GlucoseAverageDailyStatus.refreshing));
    try{
      final glucoseLevel  = await repository.getBloodGlucoseOfToday();
      glucoseLevel.fold(
            (failure) => emit(state.copyWith(
            status: GlucoseAverageDailyStatus.failure, errorMessage: failure.message)),
            (response) => emit( state.copyWith(
            status: GlucoseAverageDailyStatus.success, dailyGlucoseLevel: response)),
      );
    }catch(e){
      emit(state.copyWith(
          status: GlucoseAverageDailyStatus.failure, errorMessage: e.toString()));
    }
  }
}