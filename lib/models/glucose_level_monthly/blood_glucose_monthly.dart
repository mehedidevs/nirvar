import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_glucose_monthly.freezed.dart';
part 'blood_glucose_monthly.g.dart';

@freezed
class BloodGlucoseMonthly with _$BloodGlucoseMonthly {
  const factory BloodGlucoseMonthly({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') Map<String, MonthData>? data,
  }) = _BloodGlucoseMonthly;

  factory BloodGlucoseMonthly.fromJson(Map<String, dynamic> json) =>
      _$BloodGlucoseMonthlyFromJson(json);
}

@freezed
class MonthData with _$MonthData {
  const factory MonthData({
    @JsonKey(name: 'avg_level') double? avgLevel,
    @JsonKey(name: 'category') String? category,
  }) = _MonthData;

  factory MonthData.fromJson(Map<String, dynamic> json) =>
      _$MonthDataFromJson(json);
}
