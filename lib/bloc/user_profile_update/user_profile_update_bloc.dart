import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/models/user_profile_update/user_profile_update.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

part 'user_profile_update_event.dart';
part 'user_profile_update_state.dart';

class UserProfileUpdateBloc extends Bloc<UserProfileUpdateEvent,UserProfileUpdateState>{
  final AuthRepository _repository;
  UserProfileUpdateBloc(this._repository): super(const UserProfileUpdateState()){
    on<GetUserUpdatedInformation>(_onGettingUserUpdatedInformation);
    on<OnPickedImage>(_onPickingImage);
    on<UserProfileUpdateApiCall>(_onSubmittingUpdatedInformation);
  }


  FutureOr<void> _onGettingUserUpdatedInformation(GetUserUpdatedInformation event, Emitter<UserProfileUpdateState> emit) {
    emit(state.copyWith(userProfile: event.userProfile));
  }

  FutureOr<void> _onPickingImage(OnPickedImage event, Emitter<UserProfileUpdateState> emit) {
    emit(state.copyWith(imageFile: event.imagePicked));
  }

  FutureOr<void> _onSubmittingUpdatedInformation(UserProfileUpdateApiCall event, Emitter<UserProfileUpdateState> emit) async{
    emit(state.copyWith(status: UserProfileUpdateStatus.loading));

    try {
      final submittedCredential = await _repository.updateUserProfile(state.userProfile, state.imageFile);

      submittedCredential.fold(
            (failure) => emit(state.copyWith(
            status: UserProfileUpdateStatus.failure, errorMessage: failure.message)),
            (response) => emit( state.copyWith(
            status: UserProfileUpdateStatus.success, successMessage: response)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: UserProfileUpdateStatus.failure, errorMessage: e.toString()));
    }
  }


}