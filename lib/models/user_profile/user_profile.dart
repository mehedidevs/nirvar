import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    String? name,
    String? email,
    String? number,
    String? photo,
    String? bloodGroup, // Adjusting the spelling for "blood_group"
    String? dateOfBirth,
    int? age,
    double? weight,
    double? height,
    String? gender,
    String? address,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
