part of 'forgot_password_bloc.dart';



sealed class ForgotPasswordEvent extends Equatable{

  @override
  List<Object?> get props => [];
}

final class ForgotPasswordMobileNumberChanged extends ForgotPasswordEvent{
  final String phoneNumber;
  ForgotPasswordMobileNumberChanged({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}

final class ForgotPasswordApiCall extends ForgotPasswordEvent{}