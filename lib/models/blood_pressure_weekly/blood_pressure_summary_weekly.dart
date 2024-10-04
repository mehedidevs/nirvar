import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_pressure_summary_weekly.freezed.dart';
part 'blood_pressure_summary_weekly.g.dart';

@freezed
class BloodPressureSummaryWeekly with _$BloodPressureSummaryWeekly {
  const factory BloodPressureSummaryWeekly({
    required Map<String, BloodPressureWeek>? data,
    int? status,
    String? message,
  }) = _BloodPressureSummaryWeekly;

  factory BloodPressureSummaryWeekly.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureSummaryWeeklyFromJson(json);
}

@freezed
class BloodPressureWeek with _$BloodPressureWeek {
  const factory BloodPressureWeek({
    @JsonKey(name: 'avg_systolic') String? avgSystolic,
    @JsonKey(name: 'avg_diastolic') String? avgDiastolic,
    String? category,
  }) = _BloodPressureWeek;

  factory BloodPressureWeek.fromJson(Map<String, dynamic> json) =>
      _$BloodPressureWeekFromJson(json);
}
