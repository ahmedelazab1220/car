import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/my_cars/doman/entities/mycars_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MyCarsRepo {
  Future<Either<Failure, List<MyCarsEntity>>> getMyCars();
  Future<Either<Failure, String>> addMyCar(
      {int? carFactoryId, int? carModelId, String? manufactureYear});
  Future<Either<Failure, String>> updateMyCar(
      {int? carFactoryId, int? carModelId, String? manufactureYear});
  Future<Either<Failure, String>> deleteMyCar({int? id});
}
