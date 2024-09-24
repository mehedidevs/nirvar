part of 'register_user_credentials_bloc.dart';

enum RegisterUserCredentialsStatus { initial, loading, success, failure }

final class RegisterUserCredentialsState extends Equatable {
  final RegisterUserCredentialsStatus status;
  final UserCredentials credentials;
  final String errorMessage;
  final String successMessage;

  const RegisterUserCredentialsState({
    this.status = RegisterUserCredentialsStatus.initial,
    this.credentials = const UserCredentials(userId: 0, name: '', gender: '', dateOfBirth: '', bloodGroup: '',password: '',email: '',weight: '',address: '',heightFt: '',heightIn: ''),
    this.errorMessage = '',
    this.successMessage = '',
  });

  RegisterUserCredentialsState copyWith({
    RegisterUserCredentialsStatus? status,
    UserCredentials? user,
    String? errorMessage,
    String? successMessage,
  }) {
    return RegisterUserCredentialsState(
      status: status ?? this.status,
      credentials: user ?? this.credentials,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }

  @override
  List<Object?> get props => [status,credentials,errorMessage,successMessage];
}