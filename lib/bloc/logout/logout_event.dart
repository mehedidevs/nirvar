part of 'logout_bloc.dart';

sealed class LogoutEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

final class LogOutApiCall extends LogoutEvent{}