part of 'forgot_password_otp_send_bloc.dart';

sealed class  ForgotPasswordOtpSendEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class ForgotPasswordOtpChange extends ForgotPasswordOtpSendEvent{
  final int otp;
  ForgotPasswordOtpChange({required this.otp});
  @override
  List<Object?> get props => [otp];
}

final class ForgotPasswordOtpSendApiCall extends ForgotPasswordOtpSendEvent{}

final class ForgotPasswordOtpResendApiCall extends ForgotPasswordOtpSendEvent{}