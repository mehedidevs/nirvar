part of 'register_otp_send_bloc.dart';

sealed class RegisterOtpSendEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetOTP extends RegisterOtpSendEvent{
  final int otp;
  GetOTP({required this.otp});
  @override
  List<Object?> get props => [otp];
}

final class RegisterOtpSendApiCall extends RegisterOtpSendEvent{}

final class RegisterOtpResendApiCall extends RegisterOtpSendEvent{}