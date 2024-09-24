import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';
import '../../models/user/user.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repository;

  LoginBloc(this._repository) : super(const LoginState()) {
    on<LoginMobileNumberChanged>(_onMobileNumberChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginApiCall>(_onSubmittedCredentials);
  }

  FutureOr<void> _onMobileNumberChanged(
      LoginMobileNumberChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(phoneNumber: event.phoneNumber),
    );
  }

  FutureOr<void> _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(password: event.password),
    );
  }

  FutureOr<void> _onSubmittedCredentials(
      LoginApiCall event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      final submitCredentials =
          await _repository.loginUser(state.phoneNumber, state.password);
      submitCredentials.fold(
        (failure) => emit(state.copyWith(
            status: LoginStatus.failure, errorMessage: failure.message)),
        (user) => emit(state.copyWith(status: LoginStatus.success, user: user)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: LoginStatus.failure, errorMessage: e.toString()));
    }
  }
}
