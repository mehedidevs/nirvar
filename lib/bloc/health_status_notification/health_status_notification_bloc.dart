import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nirvar/models/health_notification/health_notification.dart';
import 'package:nirvar/repository/notification/notification_repository.dart';

part 'health_status_notification_event.dart';
part 'health_status_notification_state.dart';

class HealthStatusNotificationBloc
    extends Bloc<HealthStatusNotificationEvent, HealthStatusNotificationState> {
  final NotificationRepository repository;

  HealthStatusNotificationBloc({required this.repository})
      : super(const HealthStatusNotificationState()) {
    on<GetNotificationFromApi>(_onGettingNotificationFromApi);
  }

  FutureOr<void> _onGettingNotificationFromApi(
      GetNotificationFromApi event, Emitter<HealthStatusNotificationState> emit) async {
    emit(state.copyWith(status: NotificationStatus.loading));

    try {
      final response = await repository.showNotification();

      response.fold(
            (failure) {
          emit(state.copyWith(
            status: NotificationStatus.failure,
            errorMessage: failure.message,
          ));
        },
            (success) {
          emit(state.copyWith(
            status: NotificationStatus.success,
            notificationList: success,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: NotificationStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
