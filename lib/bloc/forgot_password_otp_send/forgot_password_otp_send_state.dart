part of 'forgot_password_otp_send_bloc.dart';

enum ForgotPasswordOtpSendStatus { initial, loading,success, failure,  resendLoading,  resendSuccess,  resendFailure, }

final class ForgotPasswordOtpSendState extends Equatable {
  final ForgotPasswordOtpSendStatus status;
  final int otp;
  final String successMessage;
  final String errorMessage;

  const ForgotPasswordOtpSendState({
    this.status = ForgotPasswordOtpSendStatus.initial,
    this.otp = 0,
    this.successMessage = '',
    this.errorMessage = '',
  });

  ForgotPasswordOtpSendState copyWith({
    ForgotPasswordOtpSendStatus? status,
    int? otp,
    String? successMessage,
    String? errorMessage,
  }) {
    return ForgotPasswordOtpSendState(
      status: status ?? this.status,
      otp: otp ?? this.otp,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, otp, successMessage, errorMessage];
}
