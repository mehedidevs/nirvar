import 'package:freezed_annotation/freezed_annotation.dart';

part 'created_folder_for_prescription.freezed.dart';
part 'created_folder_for_prescription.g.dart';

@freezed
class CreatedFolderForPrescription with _$CreatedFolderForPrescription {
  const factory CreatedFolderForPrescription({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'id') int? id,
  }) = _CreatedFolderForPrescription;

  factory CreatedFolderForPrescription.fromJson(Map<String, dynamic> json) =>
      _$CreatedFolderForPrescriptionFromJson(json);
}
