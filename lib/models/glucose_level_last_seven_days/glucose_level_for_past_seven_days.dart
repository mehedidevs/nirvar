import 'package:freezed_annotation/freezed_annotation.dart';

part 'glucose_level_for_past_seven_days.freezed.dart';
part 'glucose_level_for_past_seven_days.g.dart';

@freezed
class GlucoseLevelForPastSevenDays with _$GlucoseLevelForPastSevenDays {
  const factory GlucoseLevelForPastSevenDays({
    int? status,
    String? message,
    Map<String, GlucoseValues>? data,
    @JsonKey(name: 'avg_level') String? avgLevel,
  }) = _GlucoseLevelForPastSevenDays;

  // Auto-generate fromJson/toJson methods
  factory GlucoseLevelForPastSevenDays.fromJson(Map<String, dynamic> json) =>
      _$GlucoseLevelForPastSevenDaysFromJson(json);
}

@freezed
class GlucoseValues with _$GlucoseValues {
  const factory GlucoseValues({
    @JsonKey(name: 'value_one') double? valueOne,
    @JsonKey(name: 'value_two') double? valueTwo,
  }) = _GlucoseValues;

  // Auto-generate fromJson/toJson methods
  factory GlucoseValues.fromJson(Map<String, dynamic> json) =>
      _$GlucoseValuesFromJson(json);
}
