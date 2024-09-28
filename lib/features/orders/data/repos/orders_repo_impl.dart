import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/orders/data/data_sources/orders_remote_data_source.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OrdersRepoImpl extends OrdersRepo {
  final OrdersRemoteDataSource ordersRemoteDataSource;
  OrdersRepoImpl({
    required this.ordersRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<ProviderTimesEntity>>> getProviderTimes(
      {int? providerId, String? orderDate}) async {
    try {
      final response = await ordersRemoteDataSource.getProviderTimes(
          providerId: providerId, orderDate: orderDate);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getMyOrders(
      {String? orderStatuse, String? orderType}) async {
    try {
      final response = await ordersRemoteDataSource.getMyOrders(
          orderStatuse: orderStatuse, orderType: orderType);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> addOrder(
      {String? orderType,
      int? providerId,
      String? orderDate,
      String? orderFromTime,
      String? orderToTime,
      String? paymentMethod}) async {
    try {
      final response = await ordersRemoteDataSource.addOrder(
          orderType: orderType,
          providerId: providerId,
          orderDate: orderDate,
          orderFromTime: orderFromTime,
          orderToTime: orderToTime,
          paymentMethod: paymentMethod);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> cancelOrder({int? orderId}) async {
    try {
      final response =
          await ordersRemoteDataSource.cancelOrder(orderId: orderId);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
