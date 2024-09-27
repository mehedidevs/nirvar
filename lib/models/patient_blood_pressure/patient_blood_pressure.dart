import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_blood_pressure.freezed.dart';
part 'patient_blood_pressure.g.dart';

@freezed
class PatientBloodPressure with _$PatientBloodPressure {
  const factory PatientBloodPressure({
    @JsonKey(name: 'id') required int bpId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'systolic') int? systolic,
    @JsonKey(name: 'diastolic') int? diastolic,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PatientBloodPressure;

  factory PatientBloodPressure.fromJson(Map<String, dynamic> json) =>
      _$PatientBloodPressureFromJson(json);
}
