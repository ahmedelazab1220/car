import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/my_services/data/data_sources/my_services_remote_data_source.dart';
import 'package:car_help/features/my_services/domain/entities/my_services_entity.dart';
import 'package:car_help/features/my_services/domain/repos/my_service_repo.dart';
import 'package:dio/dio.dart';

class MyServicesRepoImpl extends MyServicesRepo {
  final MyServicesRemoteDataSource myServicesRemoteDataSource;
  MyServicesRepoImpl({
    required this.myServicesRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<OrderEntity>>> getMyService() async {
    try {
      final response = await myServicesRemoteDataSource.getMyService();
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
