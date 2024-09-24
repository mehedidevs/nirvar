import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_update.freezed.dart';
part 'user_profile_update.g.dart';

@freezed
class UserProfileUpdate with _$UserProfileUpdate {
  const factory UserProfileUpdate({
    String? name,
    String? email,
    String? gender,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    String? weight,
    @JsonKey(name: 'height_ft') String? heightFt,
    @JsonKey(name: 'height_in') String? heightIn,
    String? address,
    @JsonKey(fromJson: _multipartFileFromJson, toJson: _multipartFileToJson) MultipartFile? photo,
  }) = _UserProfileUpdate;

  factory UserProfileUpdate.fromJson(Map<String, dynamic> json) => _$UserProfileUpdateFromJson(json);
}

// Custom methods to handle MultipartFile
MultipartFile? _multipartFileFromJson(dynamic json) {
  // Normally you won't deserialize MultipartFile, so this can return null
  return null;
}

dynamic _multipartFileToJson(MultipartFile? file) {
  // MultipartFile can't be serialized to JSON, so this just returns null or some identifier
  return null;
}
