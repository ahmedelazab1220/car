import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/home_provider/domain/entities/home_provider_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeProviderRepo {
  Future<Either<Failure, HomeProviderEntity>> getHomeProvider();
}
