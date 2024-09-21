import 'dart:convert';

import 'package:car_help/core/utils/app_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  Future<void> cacheData(Map<String, dynamic> data, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String dataJson = jsonEncode(data);
    await prefs.setString(key, dataJson);
  }

  Future<void> cacheListData(
      List<Map<String, dynamic>> data, String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String dataJson = jsonEncode(data);
    await prefs.setString(key, dataJson);
  }

  Future<void> saveUserData(
    String token,
    String? userType,
    int? id,
  ) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(AppStrings.userToken, token);
    await sharedPreferences.setString(
        AppStrings.userType, userType ?? AppStrings.both);
    await sharedPreferences.setInt(AppStrings.userId, id ?? 0);
  }

  static Future<String> getSavedLanguage() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final cachedLangCode = sharedPreferences.getString(AppStrings.locale);
      return cachedLangCode ?? PlatformDispatcher.instance.locale.languageCode;
    } catch (e) {
      return PlatformDispatcher.instance.locale.languageCode;
    }
  }

  Future<int?> getId() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getInt(AppStrings.userId);
  }

  Future<String?> getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(AppStrings.userToken);
  }

  Future<void> setIsFirstTime(bool isFirstTime) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(AppStrings.isFirstTime, isFirstTime);
  }

  Future<void> setInChat(bool inChat) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(AppStrings.inChat, inChat);
  }

  Future<bool?> isFirstTime() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool(AppStrings.isFirstTime);
  }

  Future<bool?> inChat() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getBool(AppStrings.inChat);
  }

  Future<String?> getUserType() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(AppStrings.userType);
  }

  // Delete cached user data
  Future<void> deleteCache() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    setIsFirstTime(false);
  }
}
