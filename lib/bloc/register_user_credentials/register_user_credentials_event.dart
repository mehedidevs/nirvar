part of 'register_user_credentials_bloc.dart';

sealed class RegisterUserCredentialsEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetUserCredentials extends RegisterUserCredentialsEvent{
  final UserCredentials credentials;
  GetUserCredentials({required this.credentials});
  @override
  List<Object?> get props => [credentials];
}

final class RegisterUserCredentialsApiCall extends RegisterUserCredentialsEvent{}