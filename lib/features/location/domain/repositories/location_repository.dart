import 'package:car_help/core/api/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:car_help/features/location/domain/entities/cities_entity.dart';
import 'package:car_help/features/location/domain/entities/distract_entity.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/location/domain/entities/place_suggestion_entity.dart';
import 'package:location/location.dart';

abstract class LocationRepository {
  Future<Either<Failure, LocationData>> getMyLocation();
  Future<Either<Failure, String>> updateMyLocation({required LatLng latLng});
  Future<Either<Failure, LocationEntity>> getAddressTitleByLocation(
      {required LatLng latLng});
  Future<Either<Failure, List<PlaceSuggestionEntity>>> fetchSuggestionLocation(
      {required String query, required String sessionToken});
  Future<Either<Failure, LocationEntity>> getPlaceLocationById(
      {required String placeId, required String sessionToken});
  Future<Either<Failure, List<CitiesEntity>>> getAllCities();
  Future<Either<Failure, List<DistractEntity>>> getAllDistracts({int page = 1});
}
