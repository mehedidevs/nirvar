import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

import '../../models/register_otp/register_otp.dart';

part 'signup_state.dart';

part 'signup_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository _repository;

  SignUpBloc(this._repository) : super(const SignUpState()) {
    on<SignUpMobileNumberChanged>(_onMobileNumberChanged);
    on<SignUpApiCall>(_onSubmittedMobileNumber);
  }

  FutureOr<void> _onMobileNumberChanged(
      SignUpMobileNumberChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  FutureOr<void> _onSubmittedMobileNumber(
      SignUpApiCall event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.loading));

    try {
      final submittedCredential =
          await _repository.registerOTP(state.phoneNumber);

      submittedCredential.fold(
          (failure) => emit(state.copyWith(
              status: SignUpStatus.failure, errorMessage: failure.message)),
          (response) => emit( state.copyWith(
              status: SignUpStatus.success, registerOTP: response)));
    } catch (e) {
      emit(state.copyWith(
          status: SignUpStatus.failure, errorMessage: e.toString()));
    }
  }
}
