import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/home_client/domain/entities/home_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:car_help/features/home_client/data/data%20sources/home_local_data_source.dart';
import 'package:car_help/features/home_client/data/data%20sources/home_remote_data_source.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, HomeEntity>> getHome() async {
    try {
      HomeEntity data = await homeRemoteDataSource.getHome();
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
