import 'package:car_help/core/api/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:car_help/features/location/domain/repositories/location_repository.dart';
import 'package:location/location.dart';

class GetMyLocationUseCase {
  final LocationRepository locationRepository;

  GetMyLocationUseCase({required this.locationRepository});

  Future<Either<Failure, LocationData>> call() async {
    return await locationRepository.getMyLocation();
  }
}
