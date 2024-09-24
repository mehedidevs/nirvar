part of 'resend_otp_bloc.dart';

enum ResendOtpStatus { initial, loading, success, failure }

final class ResendOtpState extends Equatable {
  final ResendOtpStatus status;
  final String successMessage;
  final String errorMessage;

  const ResendOtpState({
    this.status = ResendOtpStatus.initial,
    this.successMessage = '',
    this.errorMessage = '',
  });

  ResendOtpState copyWith({
    ResendOtpStatus? status,
    String? successMessage,
    String? errorMessage,
  }) {
    return ResendOtpState(
      status: status ?? this.status,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, successMessage, errorMessage];
}
