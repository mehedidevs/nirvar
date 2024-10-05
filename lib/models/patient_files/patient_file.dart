import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_file.freezed.dart';
part 'patient_file.g.dart';

@freezed
class PatientFile with _$PatientFile {
  const factory PatientFile({
    @JsonKey(name: 'id') required int fileId,
    @JsonKey(name: 'folder_id') required int folderId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'rename') String? rename,
    @JsonKey(name: 'path') String? path,
    @JsonKey(name: 'folder_name') String? folderName,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _PatientFile;

  factory PatientFile.fromJson(Map<String, dynamic> json) =>
      _$PatientFileFromJson(json);
}

