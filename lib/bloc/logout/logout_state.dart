part of 'logout_bloc.dart';

enum LogoutStatus { initial, loading, success, failure }

final class LogoutState extends Equatable {
  final LogoutStatus status;
  final String successMessage;
  final String errorMessage;

  const LogoutState({
    this.status = LogoutStatus.initial,
    this.successMessage = '',
    this.errorMessage = '',
  });

  LogoutState copyWith({
    LogoutStatus? status,
    String? successMessage,
    String? errorMessage,
  }) {
    return LogoutState(
      status: status ?? this.status,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, successMessage, errorMessage];
}