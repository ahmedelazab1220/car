import 'dart:io';

import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/data/models/user_model/user.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  // Future<UserProfileEntity> getUserProfileData({required int id});
  Future<UserEntity> getProfileData();
  Future<String> sendOtpEditPhone({
    String? phone,
  });
  Future<String> verifyOtpEditPhone({String? phone, String? otpCode});
  Future<String> editProfileData({
    String? name,
    String? email,
    File? profileImage,
    File? cv,
    List<File>? works,
    List<int>? categoryId,
    String? phone,
    String? accountType,
    String? experienceYears,
    String? url,
    String? about,
    List<int>? programs,
  });
  Future<String> deleteAccount();

  Future<String> toggleNotification(
      {int? enableNotification, int? enableAdvertisement});
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserEntity> getProfileData() async {
    var response = await apiService.get(
      endPoint: EndPoints.userData,
    );
    UserEntity entity = User.fromJson(response['data']);
    CacheHelper().cacheData(response['data'], AppStrings.userData);
    return entity;
  }

  @override
  Future<String> editProfileData({
    String? name,
    String? email,
    File? profileImage,
    File? cv,
    List<File>? works,
    List<int>? categoryId,
    String? phone,
    String? accountType,
    String? experienceYears,
    String? url,
    String? about,
    List<int>? programs,
  }) async {
    List<MultipartFile> worksFiles = [];
    if (works != null) {
      for (var file in works) {
        worksFiles.add(await MultipartFile.fromFile(file.path));
      }
    }
    FormData formData = FormData.fromMap({
      "name": name,
      "phone": phone,
    });

    var response = await apiService.post(
      endPoint: EndPoints.updateUserData,
      data: formData,
    );
    String entity = response['message'];

    return entity;
  }

  @override
  Future<String> deleteAccount() async {
    var response = await apiService.delete(
      endPoint: EndPoints.deleteAccount,
    );
    String entity = response['message'];
    return entity;
  }

  @override
  Future<String> sendOtpEditPhone({String? phone}) async {
    var response = await apiService.post(
      endPoint: EndPoints.sendOtpEditPhone,
      data: {
        "phone": phone,
      },
    );
    String entity = response['message'];

    return entity;
  }

  @override
  Future<String> verifyOtpEditPhone({String? phone, String? otpCode}) async {
    var response = await apiService.post(
      endPoint: EndPoints.verifyOtpEditPhone,
      data: {
        "phone": phone,
        "otp_code": otpCode,
      },
    );
    String data = response['message'];

    return data;
  }

  // @override
  // Future<UserEntity> updatePassword(
  //     {String? oldPassword,
  //     String? newPassword,
  //     String? confirmPassword}) async {
  //   var response = await apiService.post(
  //     endPoint: '/user/profile/password',
  //     data: {
  //       "current_password": oldPassword,
  //       "password": newPassword,
  //       "password_confirmation": confirmPassword
  //     },
  //   );
  //   UserEntity entity = User.fromJson(response);

  //   return entity;
  // }

  @override
  Future<String> toggleNotification(
      {int? enableNotification, int? enableAdvertisement}) async {
    var response = await apiService.post(
      endPoint: EndPoints.toggleNotification,
      data: {
        if (enableNotification != null)
          "enable_notification": enableNotification,
        if (enableAdvertisement != null)
          "enable_advertisement_notification": enableAdvertisement
      },
    );
    String entity = response['message'];
    return entity;
  }
}
