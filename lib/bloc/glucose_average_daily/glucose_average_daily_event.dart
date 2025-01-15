part of 'glucose_average_daily_bloc.dart';


sealed class GlucoseAverageDailyEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetGlucoseAverageDailyFromApi extends GlucoseAverageDailyEvent{}
final class RefreshGlucoseAverageDaily extends GlucoseAverageDailyEvent{}