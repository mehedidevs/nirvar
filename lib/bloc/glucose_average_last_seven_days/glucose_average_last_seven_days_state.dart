part of 'glucose_average_last_seven_days_bloc.dart';

enum GlucoseAverageLastSevenDaysStatus {
  initial,
  loading,
  refreshing,
  success,
  failure
}

final class GlucoseAverageLastSevenDaysState extends Equatable {
  final GlucoseAverageLastSevenDaysStatus status;
  final GlucoseLevelForPastSevenDays glucoseLevelForPastSevenDays;
  final String errorMessage;

  const GlucoseAverageLastSevenDaysState({
    this.status = GlucoseAverageLastSevenDaysStatus.initial,
    this.glucoseLevelForPastSevenDays = const GlucoseLevelForPastSevenDays(),
    this.errorMessage = '',
  });

  GlucoseAverageLastSevenDaysState copyWith({
    GlucoseAverageLastSevenDaysStatus? status,
    GlucoseLevelForPastSevenDays? glucoseLevelForPastSevenDays,
    String? errorMessage,
}){
    return GlucoseAverageLastSevenDaysState(
      status: status ?? this.status,
      glucoseLevelForPastSevenDays: glucoseLevelForPastSevenDays ?? this.glucoseLevelForPastSevenDays,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status,glucoseLevelForPastSevenDays,errorMessage];
}
