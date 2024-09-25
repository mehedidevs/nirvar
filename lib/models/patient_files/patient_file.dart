import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_file.freezed.dart';
part 'patient_file.g.dart';

@freezed
class PatientFile with _$PatientFile {
  const factory PatientFile({
    required int id,
    required int folderId,
    String? folderName,
    String? name,
    String? rename,
    String? type,
    String? createdAt,
    String? photo, // Optional photo field
  }) = _PatientFile;

  factory PatientFile.fromJson(Map<String, dynamic> json) => _$PatientFileFromJson(json);
}
