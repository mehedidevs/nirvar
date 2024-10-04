import 'package:freezed_annotation/freezed_annotation.dart';

part 'glucose_level.freezed.dart';
part 'glucose_level.g.dart';

@freezed
class GlucoseLevel with _$GlucoseLevel {
  const factory GlucoseLevel({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'minimum') String? minimum,
    @JsonKey(name: 'maximum') String? maximum,
  }) = _GlucoseLevel;

  factory GlucoseLevel.fromJson(Map<String, dynamic> json) =>
      _$GlucoseLevelFromJson(json);
}
