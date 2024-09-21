import 'package:equatable/equatable.dart';
import 'package:car_help/features/location/domain/entities/country_entity.dart';

import 'cities_entity.dart';
import 'distract_entity.dart';

class LocationEntity extends Equatable {
  CountryEntity? countryEntity;
  CitiesEntity? citiesEntity;
  DistractEntity? distractEntity;
  String? address;
  double? latitude;
  double? longitude;

  LocationEntity(
      {this.countryEntity,
      this.citiesEntity,
      this.distractEntity,
      this.address = "",
      this.latitude,
      this.longitude});

  @override
  List<Object?> get props => [];
}
