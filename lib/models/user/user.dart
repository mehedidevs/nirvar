import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    String? name,
    String? email,
    String? number,
    String? registerAt,
    String? photo,
    String? role,
    String? createdAt,
    String? updatedAt,
  }) = _User;


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}