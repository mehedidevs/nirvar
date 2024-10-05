import 'package:freezed_annotation/freezed_annotation.dart';

part 'created_folder_for_prescription.freezed.dart';
part 'created_folder_for_prescription.g.dart';

@freezed
class CreatedFolderForPrescription with _$CreatedFolderForPrescription {
  const factory CreatedFolderForPrescription({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'id') required int id,
  }) = _CreatedFolderForPrescription;

  factory CreatedFolderForPrescription.fromJson(Map<String, dynamic> json) =>
      _$CreatedFolderForPrescriptionFromJson(json);
}
