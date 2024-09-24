part of 'resend_otp_bloc.dart';

sealed class ResendOtpEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class ResendOtpApiCall extends ResendOtpEvent{}

