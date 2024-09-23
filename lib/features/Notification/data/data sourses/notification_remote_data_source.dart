import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/Notification/data/models/notifications/data_notification.dart';
import 'package:car_help/features/Notification/domain/entites/notification_entity.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationGroup>> getNotifications();
  Future<dynamic> markAllAsRead();
}

class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
  final ApiService apiService;

  NotificationRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<NotificationGroup>> getNotifications() async {
    Map<String, dynamic> response = await apiService.get(
      endPoint: EndPoints.notification,
    );
    List<NotificationGroup> notificationGroups = getNotificationList(response);
    return notificationGroups;
  }

  @override
  Future markAllAsRead() async {
    var response = await apiService.post(
      endPoint: EndPoints.markAllAsRead,
      data: {},
    );
    return response;
  }

  List<NotificationGroup> getNotificationList(Map<String, dynamic> response) {
    List<NotificationGroup> notificationGroups = [];
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(const Duration(days: 1));

    for (var item in response['data']) {
      NotificationEntity notification = DataNotifications.fromJson(item);
      String createdAtString = notification.createdAtE!.toString();
      DateTime createdAt = DateTime.parse(createdAtString);
      String date = _getDateLabel(createdAt, today, yesterday);

      bool found = false;
      for (var group in notificationGroups) {
        if (group.date == date) {
          group.notifications.add(notification);
          found = true;
          break;
        }
      }
      if (!found) {
        notificationGroups
            .add(NotificationGroup(date: date, notifications: [notification]));
      }
    }
    return notificationGroups;
  }

  String _getDateLabel(DateTime createdAt, DateTime today, DateTime yesterday) {
    if (createdAt.year == today.year &&
        createdAt.month == today.month &&
        createdAt.day == today.day) {
      return 'Today - ${createdAt.day} ${_getMonthName(createdAt.month)}, ${createdAt.year}';
    } else if (createdAt.year == yesterday.year &&
        createdAt.month == yesterday.month &&
        createdAt.day == yesterday.day) {
      return 'Yesterday - ${createdAt.day} ${_getMonthName(createdAt.month)}, ${createdAt.year}';
    }
    return '${createdAt.day} ${_getMonthName(createdAt.month)}, ${createdAt.year}';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
