part of 'glucose_average_daily_bloc.dart';

enum GlucoseAverageDailyStatus {
  initial,
  loading,
  refreshing,
  success,
  failure
}

final class GlucoseAverageDailyState extends Equatable {
  final GlucoseAverageDailyStatus status;
  final String dailyGlucoseLevel;
  final String errorMessage;

  const GlucoseAverageDailyState({
    this.status = GlucoseAverageDailyStatus.initial,
    this.dailyGlucoseLevel = 'N/A',
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [status, dailyGlucoseLevel, errorMessage];

  GlucoseAverageDailyState copyWith({
    GlucoseAverageDailyStatus? status,
    String? dailyGlucoseLevel,
    String? errorMessage,
  }) {
    return GlucoseAverageDailyState(
      status: status ?? this.status,
      dailyGlucoseLevel: dailyGlucoseLevel ?? this.dailyGlucoseLevel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
