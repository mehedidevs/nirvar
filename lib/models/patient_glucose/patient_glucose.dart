import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_glucose.freezed.dart';
part 'patient_glucose.g.dart';

@freezed
class PatientGlucose with _$PatientGlucose {
  const factory PatientGlucose({
    @JsonKey(name: 'id') required int glucoseId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'blood_sugar_level') int? bloodSugarLevel,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PatientGlucose;

  factory PatientGlucose.fromJson(Map<String, dynamic> json) =>
      _$PatientGlucoseFromJson(json);
}
