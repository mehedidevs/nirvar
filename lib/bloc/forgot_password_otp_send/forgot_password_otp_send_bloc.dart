import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

part 'forgot_password_otp_send_event.dart';

part 'forgot_password_otp_send_state.dart';

class ForgotPasswordOtpSendBloc
    extends Bloc<ForgotPasswordOtpSendEvent, ForgotPasswordOtpSendState> {
  final AuthRepository _repository;

  ForgotPasswordOtpSendBloc(this._repository)
      : super(const ForgotPasswordOtpSendState()) {
    on<ForgotPasswordOtpChange>(_onOtpChange);
    on<ForgotPasswordOtpSendApiCall>(_onSubmittingOTP);
    on<ForgotPasswordOtpResendApiCall>(_onResendingOTP);
  }

  FutureOr<void> _onOtpChange(
      ForgotPasswordOtpChange event, Emitter<ForgotPasswordOtpSendState> emit) {
    emit(state.copyWith(otp: event.otp));
  }

  FutureOr<void> _onSubmittingOTP(ForgotPasswordOtpSendApiCall event,
      Emitter<ForgotPasswordOtpSendState> emit) async {
    emit(state.copyWith(status: ForgotPasswordOtpSendStatus.loading));
    try {
      final resendingOTP = await _repository.sendForgotPasswordOTP(state.otp);
      resendingOTP.fold(
        (failure) {
          emit(state.copyWith(
              status: ForgotPasswordOtpSendStatus.failure,
              errorMessage: failure.message));
        },
        (response) {
          emit(state.copyWith(
              status: ForgotPasswordOtpSendStatus.success,
              successMessage: response));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: ForgotPasswordOtpSendStatus.failure,
          errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onResendingOTP(ForgotPasswordOtpResendApiCall event,
      Emitter<ForgotPasswordOtpSendState> emit) async {
    emit(state.copyWith(status: ForgotPasswordOtpSendStatus.resendLoading));

    try {
      final submittingCredentials =
          await _repository.resendOTP();

      submittingCredentials.fold(
            (failure) {
          emit(state.copyWith(
              status: ForgotPasswordOtpSendStatus.resendFailure,
              errorMessage: failure.message));
        },
            (response) {
          emit(state.copyWith(
              status: ForgotPasswordOtpSendStatus.resendSuccess, successMessage: response));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: ForgotPasswordOtpSendStatus.resendFailure, errorMessage: e.toString()));
    }

  }
}
