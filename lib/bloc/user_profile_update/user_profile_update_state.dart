part of 'user_profile_update_bloc.dart';

enum UserProfileUpdateStatus { initial, loading, success, failure }

final class UserProfileUpdateState extends Equatable {
  final UserProfileUpdateStatus status;
  final UserProfileUpdate userProfile;
  final String errorMessage;
  final String successMessage;
  final File? imageFile;

  const UserProfileUpdateState({
    this.status = UserProfileUpdateStatus.initial,
    this.userProfile = const UserProfileUpdate(
        address: '',
        weight: '',
        email: '',
        bloodGroup: '',
        dateOfBirth: '',
        gender: '',
        name: '',
        heightFt: '',
        heightIn: ''),
    this.errorMessage = '',
    this.successMessage = '',
    this.imageFile,
  });

  UserProfileUpdateState copyWith({
    UserProfileUpdateStatus? status,
    UserProfileUpdate? userProfile,
    String? errorMessage,
    String? successMessage,
    File? imageFile,
  }) {
    return UserProfileUpdateState(
        status: status ?? this.status,
        userProfile: userProfile ?? this.userProfile,
        errorMessage: errorMessage ?? this.errorMessage,
        successMessage: successMessage ?? this.successMessage,
      imageFile: imageFile ?? this.imageFile,
    );
  }

  @override
  List<Object?> get props =>
      [status, userProfile, errorMessage, successMessage,imageFile];
}
