import 'package:car_help/core/api/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/location/domain/repositories/location_repository.dart';

class GetPlaceLocationByIdUseCase {
  final LocationRepository locationRepository;

  GetPlaceLocationByIdUseCase({required this.locationRepository});

  Future<Either<Failure, LocationEntity>> call(
      {required String placeId, required String sessionToken}) async {
    return await locationRepository.getPlaceLocationById(
        placeId: placeId, sessionToken: sessionToken);
  }
}
