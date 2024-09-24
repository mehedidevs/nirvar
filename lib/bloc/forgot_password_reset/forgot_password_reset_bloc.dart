import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

part 'forgot_password_reset_event.dart';

part 'forgot_password_reset_state.dart';

class ForgotPasswordResetBloc
    extends Bloc<ForgotPasswordResetEvent, ForgotPasswordResetState> {
  final AuthRepository _repository;

  ForgotPasswordResetBloc(this._repository)
      : super(const ForgotPasswordResetState()) {
    on<ConfirmedNewPassword>(_onPasswordConfirmed);
    on<ForgotPasswordResetApiCall>(_onSubmittingNewPassword);
  }

  FutureOr<void> _onPasswordConfirmed(
      ConfirmedNewPassword event, Emitter<ForgotPasswordResetState> emit) {
    emit(state.copyWith(newPassword: event.newPassword));
  }

  FutureOr<void> _onSubmittingNewPassword(ForgotPasswordResetApiCall event,
      Emitter<ForgotPasswordResetState> emit) async {
    emit(state.copyWith(status: ForgotPasswordResetStatus.loading));
    try {
      final resendingOTP =
          await _repository.forgotPasswordReset(state.newPassword);
      resendingOTP.fold(
        (failure) {
          emit(state.copyWith(
              status: ForgotPasswordResetStatus.failure,
              errorMessage: failure.message));
        },
        (response) {
          emit(state.copyWith(
              status: ForgotPasswordResetStatus.success,
              successMessage: response));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          status: ForgotPasswordResetStatus.failure,
          errorMessage: e.toString()));
    }
  }
}
