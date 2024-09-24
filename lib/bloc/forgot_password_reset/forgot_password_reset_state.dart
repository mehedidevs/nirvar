part of 'forgot_password_reset_bloc.dart';

enum ForgotPasswordResetStatus { initial, loading, success, failure }

final class ForgotPasswordResetState extends Equatable {
  final ForgotPasswordResetStatus status;
  final String successMessage;
  final String errorMessage;
  final String newPassword;

  const ForgotPasswordResetState({
    this.status = ForgotPasswordResetStatus.initial,
    this.successMessage = '',
    this.errorMessage = '',
    this.newPassword = '',
  });

  ForgotPasswordResetState copyWith({
    ForgotPasswordResetStatus? status,
    String? successMessage,
    String? errorMessage,
    String? newPassword,
  }) {
    return ForgotPasswordResetState(
      status: status ?? this.status,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  @override
  List<Object?> get props => [status,successMessage,errorMessage,newPassword];
}
