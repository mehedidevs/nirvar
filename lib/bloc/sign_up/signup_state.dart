part of 'signup_bloc.dart';

enum SignUpStatus{initial, loading, success, failure}

final class SignUpState extends Equatable {
  final SignUpStatus status;
  final String phoneNumber;
  final RegisterOtp registerOtp;
  final String errorMessage;

  const SignUpState({
    this.status = SignUpStatus.initial,
    this.phoneNumber= '',
    this.registerOtp = const RegisterOtp(number: '', id: 0),
    this.errorMessage = '',
  });

  SignUpState copyWith({
    SignUpStatus? status,
    String? phoneNumber,
    RegisterOtp? registerOTP,
    String? errorMessage,
  }) {
    return SignUpState(
      status: status ?? this.status,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      registerOtp: registerOTP ?? registerOtp,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, phoneNumber, registerOtp,errorMessage];
}
