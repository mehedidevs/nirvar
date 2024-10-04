import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_uploaded_file.freezed.dart';
part 'latest_uploaded_file.g.dart';

@freezed
class LatestUploadedFile with _$LatestUploadedFile {
  factory LatestUploadedFile({
    @JsonKey(name: 'folder_id') required int folderId,
    @JsonKey(name: 'folder_name') required String folderName,
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'rename') required String rename,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'path') required String path,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _LatestUploadedFile;

  // Factory method for JSON deserialization
  factory LatestUploadedFile.fromJson(Map<String, dynamic> json) =>
      _$LatestUploadedFileFromJson(json);
}
