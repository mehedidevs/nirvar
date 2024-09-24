part of 'user_profile_details_bloc.dart';

enum UserProfileDetailsStatus { initial, loading, success, failure }

final class UserProfileDetailsState extends Equatable {
  final UserProfileDetailsStatus status;
  final UserProfile userProfile;
  final String errorMessage;

  const UserProfileDetailsState({
    this.status = UserProfileDetailsStatus.initial,
    this.userProfile = const UserProfile(height: '',address: '',weight: '',email: '',age: 0,bloodGroup: '',dateOfBirth: '',gender: '',name: '',number: '',photo: ''),
    this.errorMessage = '',
  });

  UserProfileDetailsState copyWith({
    UserProfileDetailsStatus? status,
    UserProfile? userProfile,
    String? errorMessage,
  }){
    return UserProfileDetailsState(
        status: status ?? this.status,
        userProfile: userProfile ?? this.userProfile,
        errorMessage: errorMessage ?? this.errorMessage
    );

  }

  @override
  List<Object?> get props => [status,userProfile,errorMessage];
}
