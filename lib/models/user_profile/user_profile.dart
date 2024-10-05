import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
 const factory UserProfile({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'number') String? number,
    @JsonKey(name: 'photo') String? photo,
    @JsonKey(name: 'blood_gorup') String? bloodGroup, // Fix typo by mapping it
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'age') int? age,
    @JsonKey(name: 'weight') String? weight,
    @JsonKey(name: 'height') String? height,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'address') String? address,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
