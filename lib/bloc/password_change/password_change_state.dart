part of 'password_change_bloc.dart';

enum PasswordChangeStatus { initial, loading, success, failure }

final class PasswordChangeState extends Equatable {
  final PasswordChangeStatus status;
  final String oldPassword;
  final String newPassword;
  final String successMessage;
  final String errorMessage;

  const PasswordChangeState({
    this.status = PasswordChangeStatus.initial,
    this.oldPassword = '',
    this.newPassword = '',
    this.successMessage = '',
    this.errorMessage = '',
  });

  PasswordChangeState copyWith({
    PasswordChangeStatus? status,
    String? oldPassword,
    String? newPassword,
    String? successMessage,
    String? errorMessage,
  }) {
    return PasswordChangeState(
      status: status ?? this.status,
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status,oldPassword,newPassword, successMessage, errorMessage];
}
