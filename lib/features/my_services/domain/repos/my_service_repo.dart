import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MyServicesRepo {
  Future<Either<Failure, List<OrderEntity>>> getMyService();
}
