import 'package:dartz/dartz.dart';

import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/exhibits/data/data_sources/exhibits_remote_data_source.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/domain/repos/exhibits_repo.dart';
import 'package:dio/dio.dart';

class ExhibitsRepoImpl extends ExhibitsRepo {
  final ExhibitsRemoteDataSource exhibitsRemoteDataSource;
  ExhibitsRepoImpl({
    required this.exhibitsRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<ExhibitsEntity>>> getExhibits() async {
    try {
      final response = await exhibitsRemoteDataSource.getExhibits();
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
  Future<Either<Failure, String>> addExhibits() {
    // TODO: implement addExhibits
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletaExhibits({int? id}) async {
    try {
      final response = await exhibitsRemoteDataSource.deletaExhibits(id: id);
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
  Future<Either<Failure, String>> updateExhibits() {
    // TODO: implement updateExhibits
    throw UnimplementedError();
  }
}
