import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

part 'password_change_event.dart';
part 'password_change_state.dart';

class PasswordChangeBloc extends Bloc<PasswordChangeEvent,PasswordChangeState>{
  final AuthRepository _repository;
  PasswordChangeBloc(this._repository) : super(const PasswordChangeState()){
    on<GetOldPassword>(_onSubmittingOldPassword);
    on<GetNewPassword>(_onSubmittingNewPassword);
    on<PasswordChangeApiCall>(_onSubmittingCredentials);
  }


  FutureOr<void> _onSubmittingOldPassword(GetOldPassword event, Emitter<PasswordChangeState> emit) {
    emit(state.copyWith(oldPassword: event.oldPassword));
  }

  FutureOr<void> _onSubmittingNewPassword(GetNewPassword event, Emitter<PasswordChangeState> emit) {
    emit(state.copyWith(newPassword: event.newPassword));
  }


  FutureOr<void> _onSubmittingCredentials(PasswordChangeApiCall event, Emitter<PasswordChangeState> emit) async {
    emit(state.copyWith(status: PasswordChangeStatus.loading));

    try {
      final resendingOTP = await _repository.changeUserPassword(state.oldPassword,state.newPassword);
      resendingOTP.fold(
            (failure) => emit(state.copyWith(
            status: PasswordChangeStatus.failure, errorMessage: failure.message)),
            (response) => emit(state.copyWith(
            status: PasswordChangeStatus.success, successMessage: response)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: PasswordChangeStatus.failure, errorMessage: e.toString()));
    }
  }
}