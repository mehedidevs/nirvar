import 'package:freezed_annotation/freezed_annotation.dart';

part 'selected_folder.freezed.dart';
part 'selected_folder.g.dart';

@freezed
class SelectedFolder with _$SelectedFolder {
  const factory SelectedFolder({
    @JsonKey(name: 'id') int? id, // Optional and mapped to 'id' in the JSON
            @JsonKey(name: 'name') String? name, // Optional and mapped to 'name' in the JSON
  }) = _SelectedFolder;

  factory SelectedFolder.fromJson(Map<String, dynamic> json) =>
  _$SelectedFolderFromJson(json);
}
