import 'dart:convert';

import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/data/models/user_model/user.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileLocalDataSource {
  Future<UserEntity?> getProfileData();
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  @override
  Future<UserEntity?> getProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? dataJson = prefs.getString(AppStrings.userData);

    if (dataJson != null) {
      final Map<String, dynamic> jsonData =
          jsonDecode(dataJson) as Map<String, dynamic>;
      UserEntity data = User.fromJson(jsonData);

      return data;
    }
    return null;
  }
}
