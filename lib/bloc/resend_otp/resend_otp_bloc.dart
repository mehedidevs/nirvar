import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/authentication/auth_repository.dart';

part 'resend_otp_event.dart';
part 'resend_otp_state.dart';

class ResendOtpBloc extends Bloc<ResendOtpEvent, ResendOtpState> {
  final AuthRepository _repository;

  ResendOtpBloc(this._repository) : super(const ResendOtpState()) {
    on<ResendOtpApiCall>(_onSendingNewOTP);
  }

  FutureOr<void> _onSendingNewOTP(
      ResendOtpApiCall event, Emitter<ResendOtpState> emit) async {
    emit(state.copyWith(status: ResendOtpStatus.loading));

    try {
      final resendingOTP = await _repository.resendOTP();
      resendingOTP.fold(
        (failure) => emit(state.copyWith(
            status: ResendOtpStatus.failure, errorMessage: failure.message)),
        (response) => emit(state.copyWith(
            status: ResendOtpStatus.success, successMessage: response)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: ResendOtpStatus.failure, errorMessage: e.toString()));
    }
  }
}
