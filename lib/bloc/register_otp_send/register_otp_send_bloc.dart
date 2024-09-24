import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

part 'register_otp_send_event.dart';
part 'register_otp_send_state.dart';

class RegisterOtpSendBloc
    extends Bloc<RegisterOtpSendEvent, RegisterOtpSendState> {
  final AuthRepository _repository;

  RegisterOtpSendBloc(this._repository) : super(const RegisterOtpSendState()) {
    on<GetOTP>(_onGettingOTP);
    on<RegisterOtpSendApiCall>(_onSubmittingOTP);
    on<RegisterOtpResendApiCall>(_onResendingOTP);
  }

  FutureOr<void> _onGettingOTP(
      GetOTP event, Emitter<RegisterOtpSendState> emit) {
    emit(state.copyWith(otp: event.otp));
  }

  FutureOr<void> _onSubmittingOTP(
      RegisterOtpSendApiCall event, Emitter<RegisterOtpSendState> emit) async {
    emit(state.copyWith(status: RegisterOtpSendStatus.loading));

    try {
      final submittingCredentials =
          await _repository.registerOTPSend(state.otp);

      submittingCredentials.fold(
        (failure) {
          emit(state.copyWith(
              status: RegisterOtpSendStatus.failure,
              errorMessage: failure.message));
        },
        (response) {
          emit(state.copyWith(
              status: RegisterOtpSendStatus.success, successMessage: response));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: RegisterOtpSendStatus.failure, errorMessage: e.toString()));
    }
  }

  FutureOr<void> _onResendingOTP(RegisterOtpResendApiCall event, Emitter<RegisterOtpSendState> emit) async{
    emit(state.copyWith(status: RegisterOtpSendStatus.resendOtpLoading));

    try {
      final submittingCredentials =
          await _repository.resendOTP();

      submittingCredentials.fold(
            (failure) {
          emit(state.copyWith(
              status: RegisterOtpSendStatus.resendOtpFailure,
              errorMessage: failure.message));
        },
            (response) {
          emit(state.copyWith(
              status: RegisterOtpSendStatus.resendOtpSuccess, successMessage: response));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: RegisterOtpSendStatus.resendOtpFailure, errorMessage: e.toString()));
    }
  }
}
