import 'dart:convert';

import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/addresses/data/models/address_model.dart';
import 'package:car_help/features/addresses/domain/entities/address_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AddressesLocalDataSource {
  Future<List<AddressEntity>> getAddresses();

}

class AddressesLocalDataSourceImpl extends AddressesLocalDataSource {
  @override
  Future<List<AddressEntity>> getAddresses()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? dataJson = prefs.getString(AppStrings.addresses);

    if (dataJson != null) {
      List<dynamic> jsonList = jsonDecode(dataJson);
      return jsonList
          .map((json) => AddressModel.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    return [];
  
  }
}
