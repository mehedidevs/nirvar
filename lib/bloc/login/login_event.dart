part of 'login_bloc.dart';


sealed class LoginEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class LoginMobileNumberChanged extends LoginEvent{
  final String phoneNumber;
  LoginMobileNumberChanged({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}

final class LoginPasswordChanged extends LoginEvent{
  final String password;
  LoginPasswordChanged({required this.password});
  @override
  List<Object?> get props => [password];
}

final class LoginApiCall extends LoginEvent{}

