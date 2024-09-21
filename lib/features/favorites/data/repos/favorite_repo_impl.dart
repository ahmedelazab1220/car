import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/favorites/data/data_sources/favorite_remote_data_source.dart';
import 'package:car_help/features/favorites/domain/repos/favorite_repo.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepoImpl({required this.favoriteRemoteDataSource});
  @override
  Future<Either<Failure, String>> toggleFavorite({int? id}) async {
    try {
      String data = await favoriteRemoteDataSource.toggleFavorite(
        id: id,
      );
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
  Future<Either<Failure, List<ProviderEntity>>> getFavorite() async {
    try {
      List<ProviderEntity> data = await favoriteRemoteDataSource.getFavorite();
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
