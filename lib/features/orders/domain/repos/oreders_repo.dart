import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<ProviderTimesEntity>>> getProviderTimes(
      {int? providerId, String? orderDate});
  Future<Either<Failure, List<OrderEntity>>> getMyOrders(
      {String? orderStatuse, String? orderType});

  Future<Either<Failure, String>> addOrder({
    String? orderType,
    int? providerId,
    String? orderDate,
    String? orderFromTime,
    String? orderToTime,
    String? paymentMethod,
  });
    Future<Either<Failure, String>> cancelOrder({int? orderId});

}
