import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/Notification/data/data%20sourses/notification_remote_data_source.dart';
import 'package:car_help/features/Notification/domain/entites/notification_entity.dart';
import 'package:car_help/features/Notification/domain/repos/notification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationRepoImpl extends NotificationRepo {
  final NotificationRemoteDataSource notificationRemoteDataSource;
  NotificationRepoImpl({
    required this.notificationRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<NotificationGroup>>> getNotifications() async {
    try {
      List<NotificationGroup> data =
          await notificationRemoteDataSource.getNotifications();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> markAllAsRead() async {
    try {
      List<NotificationGroup> data =
          await notificationRemoteDataSource.markAllAsRead();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }
}
