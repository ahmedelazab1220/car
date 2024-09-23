import 'package:car_help/features/Notification/Presentation/widgets/notifications_card.dart';
import 'package:car_help/features/Notification/domain/entites/notification_entity.dart';
import 'package:flutter/material.dart';

class NotificationsListView extends StatelessWidget {
  final List<NotificationGroup> notifications;

  const NotificationsListView({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationCard(notifications: notifications);
  }
}
