part of 'glucose_average_last_seven_days_bloc.dart';

sealed class GlucoseAverageLastSevenDaysEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetGlucoseAverageLastSevenDaysFromApi extends GlucoseAverageLastSevenDaysEvent{}
final class RefreshGlucoseAverageLastSevenDays extends GlucoseAverageLastSevenDaysEvent{}