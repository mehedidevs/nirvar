import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credentials.freezed.dart';
part 'user_credentials.g.dart';

@freezed
class UserCredentials with _$UserCredentials {
  const factory UserCredentials({
    required int userId,
    String? photo,
    required String name,
    String? email,
    String? password,
    required String gender,
    required String dateOfBirth,
    required String bloodGroup,
    String? weight,
    String? heightFt,
    String? heightIn,
    String? address,
  }) = _UserCredentials;

  factory UserCredentials.fromJson(Map<String, dynamic> json) => _$UserCredentialsFromJson(json);
}

