part of 'forgot_password_bloc.dart';

enum ForgotPasswordStatus { initial, loading, success, error }

final class ForgotPasswordState extends Equatable {

  final ForgotPasswordStatus status;
  final String phoneNumber;
  final String successMessage;
  final String errorMessage;

  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.initial,
    this.phoneNumber = '',
    this.successMessage = '',
    this.errorMessage = ''
  });

  ForgotPasswordState copyWith({
    ForgotPasswordStatus? status,
    String? phoneNumber,
    String? successMessage,
    String? errorMessage,
}){
    return ForgotPasswordState(
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage
    );

  }

  @override
  List<Object?> get props => [status,phoneNumber,successMessage,errorMessage];
}