part of 'password_change_bloc.dart';

sealed class PasswordChangeEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class GetOldPassword extends PasswordChangeEvent{
  final String oldPassword;
  GetOldPassword({required this.oldPassword});
  @override
  List<Object?> get props => [oldPassword];
}

final class GetNewPassword extends PasswordChangeEvent{
  final String newPassword;
  GetNewPassword({required this.newPassword});
  @override
  List<Object?> get props => [newPassword];
}

final class PasswordChangeApiCall extends PasswordChangeEvent{}

