import 'dart:io';

import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ExhibitsRepo {
  Future<Either<Failure, List<ExhibitsEntity>>> getExhibits();
  Future<Either<Failure, String>> addExhibits({
    String? title,
    num? price,
    num? priceAfterDiscount,
    int? qty,
    String? description,
    List<File>? images,
  });
  Future<Either<Failure, String>> updateExhibits({
    int? id,
    String? title,
    num? price,
    num? priceAfterDiscount,
    int? qty,
    String? description,
    List<File>? images,
  });
  Future<Either<Failure, String>> deletaExhibits({int? id});
}
