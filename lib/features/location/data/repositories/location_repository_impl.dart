import 'package:car_help/core/api/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/location/data/datasources/location_remote_data_source.dart';
import 'package:car_help/features/location/data/models/cities_model.dart';
import 'package:car_help/features/location/data/models/disctract_model.dart';
import 'package:car_help/features/location/domain/entities/cities_entity.dart';
import 'package:car_help/features/location/domain/entities/distract_entity.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/location/domain/entities/place_suggestion_entity.dart';
import 'package:car_help/features/location/domain/repositories/location_repository.dart';
import 'package:location/location.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource locationRemoteDataSource;

  LocationRepositoryImpl({
    required this.locationRemoteDataSource,
  });

  @override
  Future<Either<Failure, LocationData>> getMyLocation() async {
    Location location = Location();
    if (await _checkGPSLocation(location)) {
      if (await _checkLocationPermissions(location)) {
        LocationData locationData = await location.getLocation();
        return right(locationData);
      } else {
        return left(ServerFailure("pleaseGiveLocationPermissions"));
      }
    } else {
      return left(ServerFailure("pleaseTurnOnGps"));
    }
  }

  Future<bool> _checkGPSLocation(Location location) async {
    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  Future<bool> _checkLocationPermissions(Location location) async {
    PermissionStatus permissionGranted;
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.granted) {
      return true;
    } else {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      } else {
        return true;
      }
    }
  }

  @override
  Future<Either<Failure, List<PlaceSuggestionEntity>>> fetchSuggestionLocation(
      {required String query, required String sessionToken}) async {
    try {
      final response = await locationRemoteDataSource.fetchSuggestionLocation(
          query: query, sessionToken: sessionToken);
      return right(response);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LocationEntity>> getPlaceLocationById(
      {required String placeId, required String sessionToken}) async {
    try {
      final response = await locationRemoteDataSource.getPlaceLocationById(
          placeId: placeId, sessionToken: sessionToken);

      return right(response);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LocationEntity>> getAddressTitleByLocation(
      {required LatLng latLng}) async {
    try {
      final response = await locationRemoteDataSource.getAddressTitleByLocation(
          latLng: latLng);
      return right(response);
    } catch (error) {
      if (error is DioError) {
        return left(ServerFailure.fromDioError(error));
      } else {
        return left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CitiesEntity>>> getAllCities() async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    if (isConnected) {
      try {
        final response = await locationRemoteDataSource.getAllCities();
        List<CitiesModel> list = response
            .map<CitiesModel>((e) => CitiesModel(id: e.id, title: e.title))
            .toList();
        return right(response);
      } catch (e) {
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(ServerFailure(""));
    }
  }

  @override
  Future<Either<Failure, List<DistractEntity>>> getAllDistracts(
      {int page = 1}) async {
    try {
      final response =
          await locationRemoteDataSource.getAllDistract(page: page);
      List<DistractModel> list = response
          .map<DistractModel>((e) => DistractModel(id: e.id, title: e.title))
          .toList();
      return right(response);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateMyLocation(
      {required LatLng latLng}) async {
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    if (isConnected) {
      try {
        final response =
            await locationRemoteDataSource.updateMyLocation(latLng: latLng);
        return right(response);
      } catch (e) {
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(ServerFailure(AppStrings.notConnectedToInternet));
    }
  }
}
