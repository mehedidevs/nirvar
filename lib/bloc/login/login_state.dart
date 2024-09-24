part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

final class LoginState extends Equatable {
  final LoginStatus status;
  final String phoneNumber;
  final String password;
  final User user;
  final String errorMessage;

  const LoginState({
    this.status = LoginStatus.initial,
    this.phoneNumber= '',
    this.password = '',
    this.user = const User(id: 0, number: '', registerAt: "", photo: "", role: "",createdAt: "", updatedAt: ""),
    this.errorMessage = '',
  });

  LoginState copyWith({
    LoginStatus? status,
    String? phoneNumber,
    String? password,
    User? user,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, phoneNumber, password,user,errorMessage];
}
