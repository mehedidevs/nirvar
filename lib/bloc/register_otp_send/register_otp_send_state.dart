part of 'register_otp_send_bloc.dart';

enum RegisterOtpSendStatus {initial, loading, success, failure, resendOtpLoading,resendOtpSuccess,resendOtpFailure}

final class RegisterOtpSendState extends Equatable{
  final RegisterOtpSendStatus status;
  final int otp;
  final String successMessage;
  final String errorMessage;

  const RegisterOtpSendState({
    this.status = RegisterOtpSendStatus.initial,
    this.otp = 0,
    this.successMessage = '',
    this.errorMessage = '',
  });

  RegisterOtpSendState copyWith({
    RegisterOtpSendStatus? status,
    int? otp,
    String? successMessage,
    String? errorMessage,
  }) {
    return RegisterOtpSendState(
      status: status ?? this.status,
      otp: otp ?? this.otp,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, otp, successMessage, errorMessage];
}