import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent,ForgotPasswordState>{

  final AuthRepository _repository;
  ForgotPasswordBloc(this._repository) : super(const ForgotPasswordState()){
    on<ForgotPasswordMobileNumberChanged>(_onMobileNumberChanged);
    on<ForgotPasswordApiCall>(_onSubmittedMobileNumber);
  }


  FutureOr<void> _onMobileNumberChanged(ForgotPasswordMobileNumberChanged event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  FutureOr<void> _onSubmittedMobileNumber(ForgotPasswordApiCall event, Emitter<ForgotPasswordState> emit) async{
    emit(state.copyWith(status: ForgotPasswordStatus.loading));

    try {
      final submittedCredential =
          await _repository.getForgotPasswordOTP(state.phoneNumber);

      submittedCredential.fold(
              (failure) => emit(state.copyWith(
              status: ForgotPasswordStatus.error, errorMessage: failure.message)),
              (response) => emit( state.copyWith(
              status: ForgotPasswordStatus.success, successMessage: response)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: ForgotPasswordStatus.error, errorMessage: e.toString()));
    }
  }

}
