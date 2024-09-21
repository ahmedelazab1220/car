import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:dio/dio.dart';

import '../models/user_model/user.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login({String? phone, String? password});
  Future<String> sendOtpCode({String? phone});
  Future<UserEntity> otpVerification({String? phone, String? otpCode});
  Future<String> logout();
  Future<String> deleteAccount();
  Future<String> changePassword(
      {String? oldPassword,
      String? newPassword,
      String? newPasswordConfirmation});
  Future<UserEntity> register({
    String? userType,
    String? name,
    String? phone,
    String? password,
    String? passwordConfirmation,
    String? address,
    String? commercialRegister,
    int? cityId,
    int? districtId,
    int? lat,
    int? lng,
  });

  Future<String> updatephoneNumber({
    int? userId,
    String? phone,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserEntity> login({String? phone, String? password}) async {
    String? token = await messagingToken();
    var data = await apiService.post(
      endPoint: EndPoints.userLogin,
      data: {
        "phone": '+964$phone',
        "password": password,
        "device_token": token,
        "device_type": deviceType(),
      },
    );
    UserEntity userEntity = User.fromJson(data['data']['user']);
    CacheHelper().cacheData(data['data']['user'], AppStrings.userData);
    CacheHelper().saveUserData(
        data['data'][AppStrings.userToken], userEntity.userType, userEntity.id);
    apiService.initDio();
    return userEntity;
  }

  @override
  Future<String> sendOtpCode({String? phone}) async {
    var data = await apiService.post(
      endPoint: EndPoints.sendOtpUser,
      data: {
        "phone": '+964$phone',
      },
    );
    return data['message'];
  }

  @override
  Future<UserEntity> otpVerification({String? phone, String? otpCode}) async {
    String? token = await messagingToken();

    var data = await apiService.post(
      endPoint: EndPoints.verifyOtp,
      data: {
        "phone": '+964$phone',
        "otp_code": otpCode,
        "device_token": token,
        "device_type": deviceType(),
      },
    );
    UserEntity userEntity = User.fromJson(data['data']['user']);
    CacheHelper().cacheData(data['data']['user'], AppStrings.userData);
    CacheHelper().saveUserData(
        data['data'][AppStrings.userToken], userEntity.userType, userEntity.id);
    apiService.initDio();
    return userEntity;
  }

  @override
  Future<UserEntity> register({
    String? userType,
    String? name,
    String? phone,
    String? password,
    String? passwordConfirmation,
    String? address,
    String? commercialRegister,
    int? cityId,
    int? districtId,
    int? lat,
    int? lng,
  }) async {
    String? token = await messagingToken();

    var response = await apiService.post(
      data: {
        "user_type": userType, // client,prvodier
        "name": name,
        "phone": "+964$phone",
        "password": password,
        "password_confirmation": passwordConfirmation,
        "device_token": token,
        "device_type": deviceType(),
        //  ------- Provider Data ------ //
        if (cityId != null) "city_id": cityId,
        if (districtId != null) "district_id": districtId,
        if (address != null) "address": address,
        if (lat != null) "lat": lat,
        if (lng != null) "lng": lng,
        if (commercialRegister != null)
          "commercial_register": commercialRegister,
      },
      endPoint: EndPoints.registerUser,
    );
    UserEntity userEntity = User.fromJson(response['data']['user']);
    CacheHelper().cacheData(response['data']['user'], AppStrings.userData);
    CacheHelper().saveUserData(response['data'][AppStrings.userToken],
        userEntity.userType, userEntity.id);
    apiService.initDio();
    return userEntity;
  }

  @override
  Future<String> logout() async {
    var response =
        await apiService.post(endPoint: EndPoints.logOutUser, data: null);
    String entity = response['message'];
    apiService.initDio();
    return entity;
  }

  @override
  Future<String> updatephoneNumber({
    int? userId,
    String? phone,
  }) async {
    var response = await apiService.post(
      data: {
        "phone": phone,
        "user_id": userId,
      },
      endPoint: EndPoints.updateUserData,
    );

    String userEntity = response['message'];
    apiService.initDio();
    return userEntity;
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
  Future<String> changePassword(
      {String? oldPassword,
      String? newPassword,
      String? newPasswordConfirmation}) async {
    var response = await apiService.post(
      endPoint: EndPoints.deleteAccount,
      data: {
        "current_password": oldPassword,
        "password": newPassword,
        "password_confirmation": newPasswordConfirmation,
      },
    );
    String entity = response['message'];
    return entity;
  }
}
