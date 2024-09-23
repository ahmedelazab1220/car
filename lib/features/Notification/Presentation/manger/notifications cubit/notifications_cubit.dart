import 'package:car_help/features/Notification/data/repos/notification_repo_impl.dart';
import 'package:car_help/features/Notification/domain/entites/notification_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationRepoImpl notificationRepoImpl;
  NotificationsCubit(
    this.notificationRepoImpl,
  ) : super(NotificationsInitial());
  Future<void> getNotifications() async {
    int count;
    emit(NotificationsLoading());
    var result = await notificationRepoImpl.getNotifications();
    result.fold(
      (failure) => {
        emit(
          NotificationsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        count = calculateUnreadNotifications(success),
        emit(NotificationsCount(count: count)),
        emit(
          NotificationsSuccess(notifications: success),
        ),
      },
    );
  }

  int calculateUnreadNotifications(List<NotificationGroup> notifications) {
    int unreadCount = 0;
    for (var group in notifications) {
      for (var notification in group.notifications) {
        if (notification.isReadE == false) {
          unreadCount++;
        }
      }
    }
    return unreadCount;
  }

  Future<void> markAllAsRead() async {
    var result = await notificationRepoImpl.markAllAsRead();
    result.fold(
      (failure) => {},
      (success) => {
        emit(
          NotificationsCount(count: 0),
        ),
      },
    );
  }
}
