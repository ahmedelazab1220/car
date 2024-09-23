import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/Notification/domain/entites/notification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepo {
  Future<Either<Failure, List<NotificationGroup>>> getNotifications();
  Future<Either<Failure, dynamic>> markAllAsRead();
}
