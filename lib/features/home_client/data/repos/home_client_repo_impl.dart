import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/home_client/domain/entities/home_client_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:car_help/features/home_client/data/data%20sources/home_client_local_data_source.dart';
import 'package:car_help/features/home_client/data/data%20sources/home_client_remote_data_source.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:dio/dio.dart';

class HomeClientRepoImpl implements HomeClientRepo {
  final HomeClientRemoteDataSource homeRemoteDataSource;
  final HomeClientLocalDataSource homeLocalDataSource;

  HomeClientRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, HomeClientEntity>> getHome() async {
    try {
      HomeClientEntity data = await homeRemoteDataSource.getHome();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getServices(
      {bool remote = false}) async {
    try {
      List<ServiceEntity> data = [];
      if (remote) {
        data = await homeRemoteDataSource.getServices();
        return right(data);
      } else {
        data = await homeLocalDataSource.getServices();
        if (data.isNotEmpty) {
          return right(data);
        }
        data = await homeRemoteDataSource.getServices();
        return right(data);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
