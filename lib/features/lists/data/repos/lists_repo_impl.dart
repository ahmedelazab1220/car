import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/lists/data/data_sources/lists_remote_data_source.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ListsRepoImpl extends ListsRepo {
  final ListsRemoteDataSource listsRemoteDataSource;
  ListsRepoImpl({
    required this.listsRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<DropDownEntity>>> getCities() async {
    try {
      final response = await listsRemoteDataSource.getCities();
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
  Future<Either<Failure, List<DropDownEntity>>> getCarModels() async {
    try {
      final response = await listsRemoteDataSource.getCarModels();
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
  Future<Either<Failure, List<DropDownEntity>>> getCountries() async {
    try {
      final response = await listsRemoteDataSource.getCities();
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
  Future<Either<Failure, List<DropDownEntity>>> getDistricts({int? id}) async {
    try {
      final response = await listsRemoteDataSource.getDistricts(id: id);
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
  Future<Either<Failure, List<DropDownEntity>>> getProblemTypes() async {
    try {
      final response = await listsRemoteDataSource.getProblemTypes();
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
  Future<Either<Failure, List<DropDownEntity>>> getCarFactories() async {
    try {
      final response = await listsRemoteDataSource.getCarFactories();
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
