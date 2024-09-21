import 'package:car_help/core/api/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:car_help/features/location/domain/repositories/location_repository.dart';

class UpdateMyLocationUseCase {
  final LocationRepository locationRepository;

  UpdateMyLocationUseCase({required this.locationRepository});

  Future<Either<Failure, String>> call({required LatLng latLng}) async {
    return await locationRepository.updateMyLocation(latLng: latLng);
  }
}
