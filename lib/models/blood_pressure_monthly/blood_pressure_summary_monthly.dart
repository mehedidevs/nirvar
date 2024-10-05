import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_pressure_summary_monthly.freezed.dart';
part 'blood_pressure_summary_monthly.g.dart';

@freezed
class BloodPressureSummaryMonthly with _$BloodPressureSummaryMonthly {
  const factory BloodPressureSummaryMonthly({
    required Map<String, BloodPressureMonth>? data,
    int? status,
    String? message,
  }) = _BloodPressureSummaryMonthly;

  factory BloodPressureSummaryMonthly.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureSummaryMonthlyFromJson(json);
}

@freezed
class BloodPressureMonth with _$BloodPressureMonth {
  const factory BloodPressureMonth({
    @JsonKey(name: 'avg_systolic') String? avgSystolic,
    @JsonKey(name: 'avg_diastolic') String? avgDiastolic,
    String? category,
  }) = _BloodPressureMonth;

  factory BloodPressureMonth.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureMonthFromJson(json);
}
