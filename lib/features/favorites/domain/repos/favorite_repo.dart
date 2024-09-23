import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepo {
  Future<Either<Failure, String>> toggleFavorite({int? id});
  Future<Either<Failure, List<ProviderEntity>>> getFavorite();
}
