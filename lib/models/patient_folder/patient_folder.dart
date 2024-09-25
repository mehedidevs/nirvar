import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_folder.freezed.dart';
part 'patient_folder.g.dart';

@freezed
class PatientFolder with _$PatientFolder {
  const factory PatientFolder({
    @JsonKey(name: 'id') required int folderId,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'file_count') int? fileCount,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _PatientFolder;

  factory PatientFolder.fromJson(Map<String, dynamic> json) =>
      _$PatientFolderFromJson(json);
}
