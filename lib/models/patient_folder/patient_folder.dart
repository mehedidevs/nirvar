import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_folder.freezed.dart';
part 'patient_folder.g.dart';

@freezed
class PatientFolder with _$PatientFolder {
  const factory PatientFolder({
    required String name,
    @JsonKey(name: 'user_id') required int userId,
    required int id,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    int? fileCount, // Optional field for the file count
  }) = _PatientFolder;

  factory PatientFolder.fromJson(Map<String, dynamic> json) => _$PatientFolderFromJson(json);
}
