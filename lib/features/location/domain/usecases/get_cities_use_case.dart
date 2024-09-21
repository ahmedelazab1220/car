import 'package:car_help/core/api/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:car_help/features/location/domain/entities/cities_entity.dart';
import 'package:car_help/features/location/domain/repositories/location_repository.dart';

class GetCitiesUseCase {
  final LocationRepository locationRepository;

  GetCitiesUseCase({required this.locationRepository});

  Future<Either<Failure, List<CitiesEntity>>> call() async {
    return await locationRepository.getAllCities();
  }
}
