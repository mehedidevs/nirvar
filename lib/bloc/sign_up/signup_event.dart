

part of 'signup_bloc.dart';

sealed class SignUpEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class SignUpMobileNumberChanged extends SignUpEvent{
  final String phoneNumber;
  SignUpMobileNumberChanged({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}

final class SignUpApiCall extends SignUpEvent{}