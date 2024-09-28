import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ExhibitsRepo {
  Future<Either<Failure, List<ExhibitsEntity>>> getExhibits();
  Future<Either<Failure, String>> addExhibits();
  Future<Either<Failure, String>> updateExhibits();
  Future<Either<Failure, String>> deletaExhibits({int? id});
}
