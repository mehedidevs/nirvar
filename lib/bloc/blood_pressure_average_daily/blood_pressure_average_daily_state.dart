part of 'blood_pressure_average_daily_bloc.dart';

enum BloodPressureAverageDailyStatus {
  initial,
  loading,
  refreshing,
  success,
  failure,
}

final class BloodPressureAverageDailyState extends Equatable {
  final BloodPressureAverageDailyStatus status;
  final String systolic;
  final String diastolic;
  final String errorMessage;

  // Constructor with named parameters and defaults.
  const BloodPressureAverageDailyState({
    this.status = BloodPressureAverageDailyStatus.initial,
    this.systolic = '',
    this.diastolic = '',
    this.errorMessage = '',
  });

  // CopyWith method to create a new instance with updated fields.
  BloodPressureAverageDailyState copyWith({
    BloodPressureAverageDailyStatus? status,
    String? systolic,
    String? diastolic,
    String? errorMessage,
  }) {
    return BloodPressureAverageDailyState(
      status: status ?? this.status,
      systolic: systolic ?? this.systolic,
      diastolic: diastolic ?? this.diastolic,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  // Override props for Equatable.
  @override
  List<Object?> get props => [status, systolic, diastolic, errorMessage];

  @override
  String toString() {
    return 'BloodPressureAverageDailyState('
        'status: $status, '
        'systolic: $systolic, '
        'diastolic: $diastolic, '
        'errorMessage: $errorMessage)';
  }
}
