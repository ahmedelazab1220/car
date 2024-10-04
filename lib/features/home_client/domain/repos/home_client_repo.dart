import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/home_client/domain/entities/home_client_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeClientRepo {
  Future<Either<Failure, HomeClientEntity>> getHome({String? lat, String? lng});
  Future<Either<Failure, List<ServiceEntity>>> getServices({bool remote});
  Future<Either<Failure, ProviderEntity>> getProvider({int? providerId});
  Future<Either<Failure, List<ProviderEntity>>> search(
      {int? categoryId, String? query});
}
