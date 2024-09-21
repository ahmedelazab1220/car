import 'package:car_help/features/location/data/models/disctract_model.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';

import 'cities_model.dart';
import 'country.dart';

class LocationModel extends LocationEntity {
  LocationModel(
      {super.countryEntity,
      super.citiesEntity,
      super.distractEntity,
      super.address,
      super.latitude,
      super.longitude});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        countryEntity: json['country'] == null
            ? const Country(id: 0, title: 'title')
            : Country.fromJson(json['country'] as Map<String, dynamic>),
        citiesEntity: json['city'] == null
            ? const CitiesModel(id: 0, title: "")
            : CitiesModel.fromJson(json['city'] as Map<String, dynamic>),
        distractEntity: json['district'] == null
            ? const DistractModel(id: 0, title: "title")
            : DistractModel.fromJson(json['district'] as Map<String, dynamic>),
        address: json['address'] ?? "",
        latitude: json['latitude'] != null
            ? (json['latitude'] as num?)!.toDouble()
            : 0.0,
        longitude: json['longitude'] != null
            ? (json['longitude'] as num?)!.toDouble()
            : 0.0,
      );

  Map<String, dynamic> toJson() {
    Country countryModel = Country(
        id: countryEntity != null ? countryEntity!.id : 0,
        title: countryEntity != null ? countryEntity!.title : "0");
    CitiesModel citiesModel = CitiesModel(
        id: citiesEntity != null ? citiesEntity!.id : 0,
        title: citiesEntity != null ? citiesEntity!.title : "0");
    DistractModel distractModel = DistractModel(
        id: distractEntity != null ? distractEntity!.id : 0,
        title: distractEntity != null ? distractEntity!.title : "0");

    return {
      'country': countryModel.toJson(),
      'city': citiesModel.toJson(),
      'district': distractModel.toJson(),
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
