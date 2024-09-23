part of 'notifications_cubit.dart';

@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsSuccess extends NotificationsState {
  final List<NotificationGroup> notifications;

  NotificationsSuccess({required this.notifications});
}

final class NotificationsCount extends NotificationsState {
  final int count;

  NotificationsCount({required this.count});
}

final class NotificationsFailure extends NotificationsState {
  final String errorMessage;

  NotificationsFailure({required this.errorMessage});
}
