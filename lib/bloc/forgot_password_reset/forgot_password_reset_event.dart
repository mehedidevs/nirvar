part of 'forgot_password_reset_bloc.dart';

sealed class ForgotPasswordResetEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class ConfirmedNewPassword extends ForgotPasswordResetEvent{
  final String newPassword;
  ConfirmedNewPassword({required this.newPassword});
  @override
  List<Object?> get props => [newPassword];
}

final class ForgotPasswordResetApiCall extends ForgotPasswordResetEvent{}