import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/models/user_profile/user_profile.dart';
import 'package:nirvar/repository/authentication/auth_repository.dart';

part 'user_profile_details_event.dart';
part 'user_profile_details_state.dart';

class UserProfileDetailsBloc extends Bloc<UserProfileDetailsEvent,UserProfileDetailsState>{
  final AuthRepository _repository;
  UserProfileDetailsBloc(this._repository): super(const UserProfileDetailsState()){
    on<GetUserProfileDetailsFromApi>(_onGettingUserProfileDetails);
    on<RefreshUserProfileDetails>(_onRefreshingUserProfileDetails);
  }


  FutureOr<void> _onGettingUserProfileDetails(GetUserProfileDetailsFromApi event, Emitter<UserProfileDetailsState> emit) async {
    // Use refreshing status instead of loading if already successful
    // if (state.status == UserProfileDetailsStatus.success) {
    //   emit(state.copyWith(status: UserProfileDetailsStatus.refreshing));
    // } else {
    //
    // }

    emit(state.copyWith(status: UserProfileDetailsStatus.loading));

    try {
      final submittedCredential = await _repository.getUserProfile();

      submittedCredential.fold(
            (failure) => emit(state.copyWith(
            status: UserProfileDetailsStatus.failure, errorMessage: failure.message)),
            (response) => emit( state.copyWith(
            status: UserProfileDetailsStatus.success, userProfile: response)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: UserProfileDetailsStatus.failure, errorMessage: e.toString()));
    }
  }


  FutureOr<void> _onRefreshingUserProfileDetails(RefreshUserProfileDetails event, Emitter<UserProfileDetailsState> emit) async {

    emit(state.copyWith(status: UserProfileDetailsStatus.refreshing));

    try {
      final submittedCredential = await _repository.getUserProfile();

      submittedCredential.fold(
            (failure) => emit(state.copyWith(
            status: UserProfileDetailsStatus.failure, errorMessage: failure.message)),
            (response) => emit( state.copyWith(
            status: UserProfileDetailsStatus.success, userProfile: response)),
      );
    } catch (e) {
      emit(state.copyWith(
          status: UserProfileDetailsStatus.failure, errorMessage: e.toString()));
    }

  }
}

