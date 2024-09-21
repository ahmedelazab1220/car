import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/home_client/domain/entities/home_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeEntity>> getHome();
  Future<Either<Failure, List<ServiceEntity>>> getServices({bool remote});

}
