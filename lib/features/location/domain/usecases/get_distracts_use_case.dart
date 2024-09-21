import 'package:car_help/core/api/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:car_help/features/location/domain/entities/distract_entity.dart';
import 'package:car_help/features/location/domain/repositories/location_repository.dart';

class GetDistractsUseCase {
  final LocationRepository locationRepository;

  GetDistractsUseCase({required this.locationRepository});

  Future<Either<Failure, List<DistractEntity>>> call({int page = 1}) async {
    return locationRepository.getAllDistracts(page: page);
  }
}
