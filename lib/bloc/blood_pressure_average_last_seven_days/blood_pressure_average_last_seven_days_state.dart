part of 'blood_pressure_average_last_seven_days_bloc.dart';

enum BloodPressureAverageLastSevenDaysStatus {
  initial,
  loading,
  refreshing,
  success,
  failure
}

final class BloodPressureAverageLastSevenDaysState extends Equatable {
  final BloodPressureAverageLastSevenDaysStatus status;
  final BloodPressureHistoryForLast7Days bloodPressureHistoryForLast7Days;
  final String errorMessage;

  const BloodPressureAverageLastSevenDaysState({
    this.status = BloodPressureAverageLastSevenDaysStatus.initial,
    this.bloodPressureHistoryForLast7Days =
        const BloodPressureHistoryForLast7Days(),
    this.errorMessage = '',
  });

  BloodPressureAverageLastSevenDaysState copyWith({
    BloodPressureAverageLastSevenDaysStatus? status,
    BloodPressureHistoryForLast7Days? bloodPressureHistoryForLast7Days,
    String? errorMessage,
  }) {
    return BloodPressureAverageLastSevenDaysState(
      status: status ?? this.status,
      bloodPressureHistoryForLast7Days: bloodPressureHistoryForLast7Days ??
          this.bloodPressureHistoryForLast7Days,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, bloodPressureHistoryForLast7Days, errorMessage];
}
