part of 'blood_pressure_average_daily_bloc.dart';


sealed class BloodPressureAverageDailyEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetBloodPressureAverageDailyFromApi extends BloodPressureAverageDailyEvent{}
final class RefreshBloodPressureAverageDaily extends BloodPressureAverageDailyEvent{}