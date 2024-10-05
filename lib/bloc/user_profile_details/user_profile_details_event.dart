part of 'user_profile_details_bloc.dart';

sealed class UserProfileDetailsEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetUserProfileDetailsFromApi extends UserProfileDetailsEvent{}