import 'package:car_help/config/environment/env_helper.dart';
import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dio_logger.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    initDio();
  }

  Future<void> initDio() async {
    String? token = await CacheHelper().getToken();
    _dio.options
      ..baseUrl = Environment.apiUrl
      ..responseType = ResponseType.json
      // ..connectTimeout = const Duration(seconds: 20)
      // ..sendTimeout = const Duration(seconds: 20)
      // ..receiveTimeout = const Duration(seconds: 20)
      ..followRedirects = false
      ..headers = {
        if (token != null) "Authorization": "Bearer $token",
        AppStrings.contentType: AppStrings.applicationJson,
        AppStrings.accept: AppStrings.applicationJson,
      };
    // ..validateStatus = (status) {
    //   return status != null && status < 500;
    // };
    if (kDebugMode) {
      _dio.interceptors.add(DioLogInterceptor());
    }
  }

  Future<Map<String, dynamic>> get({
    required String endPoint,
    dynamic data,
  }) async {
    var response = await _dio.get(endPoint, data: data);
    return _parseResponse(response);
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic data,
  }) async {
    var response = await _dio.post(endPoint, data: data);
    return _parseResponse(response);
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required dynamic data,
  }) async {
    var response = await _dio.put(endPoint, data: data);
    return _parseResponse(response);
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    var response = await _dio.delete(endPoint);
    return _parseResponse(response);
  }

  Future<dynamic> download({required String endPoint}) async {
    var response = await _dio.get(
      endPoint,
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    return response.data;
  }

  Map<String, dynamic> _parseResponse(Response response) {
    return response.data as Map<String, dynamic>;
  }
}
