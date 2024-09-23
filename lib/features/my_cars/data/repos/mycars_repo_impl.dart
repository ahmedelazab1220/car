import 'package:dartz/dartz.dart';

import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/my_cars/data/data_sources/mycars_remote_data_source.dart';
import 'package:car_help/features/my_cars/doman/entities/mycars_entity.dart';
import 'package:car_help/features/my_cars/doman/repos/mycars_repo.dart';
import 'package:dio/dio.dart';

class MyCarsRepoImpl extends MyCarsRepo {
  final MyCarsRemoteDataSource myCarsRemoteDataSource;
  MyCarsRepoImpl({
    required this.myCarsRemoteDataSource,
  });
  @override
  Future<Either<Failure, String>> addMyCar(
      {int? carFactoryId, int? carModelId, String? manufactureYear}) async {
    try {
      String data = await myCarsRemoteDataSource.addMyCar(
          carFactoryId: carFactoryId,
          carModelId: carModelId,
          manufactureYear: manufactureYear!);
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
  Future<Either<Failure, String>> deleteMyCar({int? id}) async {
    try {
      String data = await myCarsRemoteDataSource.deleteMyCar(id: id!);
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
  Future<Either<Failure, List<MyCarsEntity>>> getMyCars() async {
    try {
      List<MyCarsEntity> data = await myCarsRemoteDataSource.getMyCars();
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
  Future<Either<Failure, String>> updateMyCar(
      {int? carFactoryId, int? carModelId, String? manufactureYear}) async {
    try {
      String data = await myCarsRemoteDataSource.updateMyCar(
          carFactoryId: carFactoryId,
          carModelId: carModelId,
          manufactureYear: manufactureYear!);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
