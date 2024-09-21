import 'package:car_help/config/environment/env_helper.dart';
import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/core/api/api_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/core/api/http_consumer.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/location/data/models/cities_model.dart';
import 'package:car_help/features/location/data/models/disctract_model.dart';
import 'package:car_help/features/location/data/models/location.dart';
import 'package:car_help/features/location/data/models/place_suggestion_model.dart';
import 'package:car_help/features/location/domain/entities/cities_entity.dart';
import 'package:location/location.dart' as loc;

abstract class LocationRemoteDataSource {
  Future<loc.LocationData> getMyLocation();
  Future<List<PlaceSuggestionModel>> fetchSuggestionLocation(
      {required String query, required String sessionToken});
  Future<LocationModel> getPlaceLocationById(
      {required String placeId, required String sessionToken});
  Future<LocationModel> getAddressTitleByLocation({required LatLng latLng});
  Future<List<CitiesEntity>> getAllCities();
  Future<List<DistractModel>> getAllDistract({int page = 1});

  Future<String> updateMyLocation({required LatLng latLng});
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final MapClientConsumer mapClientConsumer;
  final ApiService apiService;

  LocationRemoteDataSourceImpl(
      {required this.mapClientConsumer, required this.apiService});

  @override
  Future<loc.LocationData> getMyLocation() async {
    loc.Location location = loc.Location();
    loc.LocationData locationData = await location.getLocation();
    return locationData;
  }

  @override
  Future<List<PlaceSuggestionModel>> fetchSuggestionLocation(
      {required String query, required String sessionToken}) async {
    Map<String, dynamic> body = {
      "input": query,
      "types": "address",
      "components": "country:sa",
      "key": Environment.googleMapApiKey,
      "sessiontoken": sessionToken,
    };
    final response = await mapClientConsumer.get(EndPoints.suggestionsUrl,
        queryParameters: body);
    final suggestions = response["predictions"];
    List<PlaceSuggestionModel> list = [];

    suggestions.forEach((element) {
      PlaceSuggestionModel suggestionModel =
          PlaceSuggestionModel.fromJson(element);
      list.add(suggestionModel);
    });
    return list;
  }

  @override
  Future<LocationModel> getPlaceLocationById(
      {required String placeId, required String sessionToken}) async {
    Map<String, dynamic> body = {
      "place_id": placeId,
      "fields": "geometry",
      "key": Environment.googleMapApiKey,
      "sessiontoken": sessionToken,
    };
    final response = await mapClientConsumer.get(EndPoints.placeLocationById,
        queryParameters: body);

    double lat =
        double.parse("${response['result']['geometry']['location']['lat']}");
    double lng =
        double.parse("${response['result']['geometry']['location']['lng']}");
    LocationModel locationModel = LocationModel(latitude: lat, longitude: lng);
    LatLng latLng = LatLng(locationModel.latitude!, locationModel.longitude!);
    LocationModel address = await getAddressTitleByLocation(latLng: latLng);
    locationModel.address = address.address;
    return locationModel;
  }

  @override
  Future<LocationModel> getAddressTitleByLocation(
      {required LatLng latLng}) async {
    bool codeLanguage =
        await CacheHelper.getSavedLanguage() == AppStrings.arabicCode;
    Map<String, dynamic> body = {
      "latlng": '${latLng.latitude},${latLng.longitude}',
      'language': codeLanguage ? AppStrings.arabicCode : AppStrings.englishCode,
      "key": Environment.googleMapApiKey,
    };
    final response = await mapClientConsumer
        .get(EndPoints.getAddressNameByLocation, queryParameters: body);
    final address = response['results'][0]['formatted_address'];
    return LocationModel(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
        address: address);
  }

  @override
  Future<List<CitiesEntity>> getAllCities() async {
    final response = await apiService.get(endPoint: EndPoints.cities);
    List<CitiesEntity> list = response['data']
        .map<CitiesModel>((element) => CitiesModel.fromJson(element))
        .toList();
    return list;
  }

  @override
  Future<List<DistractModel>> getAllDistract({int page = 1}) async {
    final response = await apiService
        .get(endPoint: EndPoints.distracts, data: {"page": page});

    List<DistractModel> list = response['data']
        .map<DistractModel>((element) => DistractModel.fromJson(element))
        .toList();
    return list;
  }

  @override
  Future<String> updateMyLocation({required LatLng latLng}) async {
    LocationModel locationModel =
        await getAddressTitleByLocation(latLng: latLng);
    Map<String, dynamic> map = {
      "address": locationModel.address.toString(),
      "latitude": latLng.latitude,
      "longitude": latLng.longitude,
    };
    final response = await apiService.put(
      endPoint: EndPoints.updateUserLocation,
      data: map,
    );

    return response['message'];
  }
}
