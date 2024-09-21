import 'dart:convert';

import 'package:car_help/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:car_help/features/location/data/models/cities_model.dart';
import 'package:car_help/features/location/data/models/disctract_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocationLocaleDataSource {
  Future<List<CitiesModel>> getAllCities();

  Future<Unit> cacheCities(List<CitiesModel> list);

  Future<List<DistractModel>> getAllDistracts();

  Future<Unit> cacheDistracts(List<DistractModel> list);
}

class LocationLocaleDataSourceImpl implements LocationLocaleDataSource {
  final SharedPreferences sharedPreferences;

  LocationLocaleDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheCities(List<CitiesModel> list) async {
    sharedPreferences.setString(
        "cities", json.encode(list.map((i) => i.toJson()).toList()));
    return unit;
  }

  @override
  Future<List<CitiesModel>> getAllCities() async {
    final cities = sharedPreferences.getString("cities");
    if (cities != null) {
      List decodedSting = json.decode(cities.toString());
      List<CitiesModel> citiesList =
          decodedSting.map((e) => CitiesModel.fromJson(e)).toList();
      return citiesList;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<Unit> cacheDistracts(List<DistractModel> list) async {
    sharedPreferences.setString(
        "distracts", json.encode(list.map((i) => i.toJson()).toList()));
    return unit;
  }

  @override
  Future<List<DistractModel>> getAllDistracts() async {
    final distracts = sharedPreferences.getString("distracts");
    if (distracts != null) {
      List decodedSting = json.decode(distracts.toString());
      List<DistractModel> distractList =
          decodedSting.map((e) => DistractModel.fromJson(e)).toList();
      return distractList;
    } else {
      throw CacheException();
    }
  }
}
