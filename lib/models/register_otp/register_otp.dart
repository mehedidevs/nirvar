import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_otp.freezed.dart';
part 'register_otp.g.dart';

@freezed
class RegisterOtp with _$RegisterOtp {
  const factory RegisterOtp({
        String ? number,
        String ? role,
        String ? updatedAt,
        String ? createdAt,
        required int id,
    })=_RegisterOtp;


    factory RegisterOtp.fromJson(Map<String, dynamic> json) => _$RegisterOtpFromJson(json);
}
