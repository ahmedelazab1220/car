import 'dart:convert';

import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/home_client/data/model/service_model.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeClientLocalDataSource {
  Future<List<ServiceEntity>> getServices();
}

class HomeLocalDataSourceImpl extends HomeClientLocalDataSource {
  @override
  Future<List<ServiceEntity>> getServices() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? dataJson = prefs.getString(AppStrings.services);

    if (dataJson != null) {
      List<dynamic> jsonList = jsonDecode(dataJson);
      return jsonList
          .map((json) => ServiceModel.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    return [];
  }
}
