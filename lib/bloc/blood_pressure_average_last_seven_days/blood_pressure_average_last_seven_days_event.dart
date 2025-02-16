part of 'blood_pressure_average_last_seven_days_bloc.dart';


sealed class BloodPressureAverageLastSevenDaysEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetBloodPressureAverageLastSevenDaysFromApi extends BloodPressureAverageLastSevenDaysEvent{}
final class RefreshBloodPressureAverageLastSevenDays extends BloodPressureAverageLastSevenDaysEvent{}