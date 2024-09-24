import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

part 'logout_state.dart';
part 'logout_event.dart';

class LogOutBloc extends Bloc<LogoutEvent,LogoutState>{
  final AuthRepository _repository;

  LogOutBloc(this._repository) : super(const LogoutState()){
    on<LogOutApiCall>(_onLoggingOut);
  }


  FutureOr<void> _onLoggingOut(LogOutApiCall event, Emitter<LogoutState> emit) async {
    emit(state.copyWith(status: LogoutStatus.loading));
    try {
      final resendingOTP = await _repository.logoutUser();
      resendingOTP.fold(
            (failure) => emit(state.copyWith(
            status: LogoutStatus.failure, errorMessage: failure.message)),
            (response) => emit(state.copyWith(
            status: LogoutStatus.success, successMessage: response)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: LogoutStatus.failure, errorMessage: e.toString()));
    }
  }
}