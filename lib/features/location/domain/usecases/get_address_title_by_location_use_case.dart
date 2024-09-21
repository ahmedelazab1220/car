import 'package:car_help/core/api/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/location/domain/repositories/location_repository.dart';

class GetAddressTitleByLocationUseCase {
  final LocationRepository locationRepository;

  GetAddressTitleByLocationUseCase({required this.locationRepository});

  Future<Either<Failure, LocationEntity>> call({required LatLng latLng}) async {
    return await locationRepository.getAddressTitleByLocation(latLng: latLng);
  }
}
