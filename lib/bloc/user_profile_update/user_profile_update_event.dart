part of 'user_profile_update_bloc.dart';

sealed class UserProfileUpdateEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetUserUpdatedInformation extends UserProfileUpdateEvent{
  final UserProfileUpdate userProfile;
  GetUserUpdatedInformation({required this.userProfile});
  @override
  List<Object?> get props => [userProfile];
}

final class OnPickedImage extends UserProfileUpdateEvent{
  final File imagePicked;
  OnPickedImage({required this.imagePicked});
  @override
  List<Object?> get props => [imagePicked];
}

final class UserProfileUpdateApiCall extends UserProfileUpdateEvent{}