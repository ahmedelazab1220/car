import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/my_services/domain/entities/my_services_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MyServicesRepo {
  Future<Either<Failure, List<MyServicesEntity>>> getMyService();
}
