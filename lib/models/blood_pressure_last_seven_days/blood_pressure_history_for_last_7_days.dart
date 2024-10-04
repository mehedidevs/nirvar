import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_pressure_history_for_last_7_days.freezed.dart';
part 'blood_pressure_history_for_last_7_days.g.dart';

@freezed
class BloodPressureHistoryForLast7Days with _$BloodPressureHistoryForLast7Days {
  const factory BloodPressureHistoryForLast7Days({
    int? status,
    String? message,
    Map<String, BloodPressureSummary>? data,
    @JsonKey(name: 'avg_systolic') int? avgSystolic,
    @JsonKey(name: 'avg_diastolic') int? avgDiastolic,
  }) = _BloodPressureHistoryForLast7Days;

  factory BloodPressureHistoryForLast7Days.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureHistoryForLast7DaysFromJson(json);
}

@freezed
class BloodPressureSummary with _$BloodPressureSummary {
  const factory BloodPressureSummary({
    @JsonKey(name: 'systolic_avg') int? systolicAvg,
    @JsonKey(name: 'diastolic_avg') int? diastolicAvg,
    String? category,
  }) = _BloodPressureSummary;

  factory BloodPressureSummary.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureSummaryFromJson(json);
}
