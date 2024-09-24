import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/models/user_credentials/user_credentials.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

part 'register_user_credentials_event.dart';
part 'register_user_credentials_state.dart';


class RegisterUseCredentialsBloc extends Bloc<RegisterUserCredentialsEvent,RegisterUserCredentialsState>{
  final AuthRepository _repository;

  RegisterUseCredentialsBloc(this._repository): super(const RegisterUserCredentialsState()){
    on<GetUserCredentials>(_onReceivingCredentials);
    on<RegisterUserCredentialsApiCall>(_onSubmittingUserCredentials);
  }

  FutureOr<void> _onReceivingCredentials(GetUserCredentials event, Emitter<RegisterUserCredentialsState> emit) {
    emit(state.copyWith(user: event.credentials));
  }

  FutureOr<void> _onSubmittingUserCredentials(RegisterUserCredentialsApiCall event, Emitter<RegisterUserCredentialsState> emit) async {
    emit(state.copyWith(status: RegisterUserCredentialsStatus.loading));
    try {
      final submitCredentials =
      await _repository.registerUserCredentials(state.credentials);
      submitCredentials.fold(
            (failure) => emit(state.copyWith(
            status: RegisterUserCredentialsStatus.failure, errorMessage: failure.message)),
            (response) => emit(state.copyWith(status: RegisterUserCredentialsStatus.success, successMessage: response)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: RegisterUserCredentialsStatus.failure, errorMessage: e.toString()));
    }
  }
}