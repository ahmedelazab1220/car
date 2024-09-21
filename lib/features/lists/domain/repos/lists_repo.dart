import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ListsRepo {
  Future<Either<Failure, List<DropDownEntity>>> getCities();
  Future<Either<Failure, List<DropDownEntity>>> getCountries();
  Future<Either<Failure, List<DropDownEntity>>> getDistricts();
  Future<Either<Failure, List<DropDownEntity>>> getCarModels();
  Future<Either<Failure, List<DropDownEntity>>> getProblemTypes();
}
