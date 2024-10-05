import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_glucose_weekly.freezed.dart';
part 'blood_glucose_weekly.g.dart';

@freezed
class BloodGlucoseWeekly with _$BloodGlucoseWeekly {
  const factory BloodGlucoseWeekly({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Map<String, WeekData>? data,
  }) = _BloodGlucoseWeekly;

  factory BloodGlucoseWeekly.fromJson(Map<String, dynamic> json) =>
      _$BloodGlucoseWeeklyFromJson(json);
}

@freezed
class WeekData with _$WeekData {
  const factory WeekData({
    @JsonKey(name: 'avg_level') double? avgLevel,
    @JsonKey(name: 'category') String? category,
  }) = _WeekData;

  factory WeekData.fromJson(Map<String, dynamic> json) =>
      _$WeekDataFromJson(json);
}
