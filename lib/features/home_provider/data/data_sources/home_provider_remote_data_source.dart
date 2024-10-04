import 'dart:io';

import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/home_provider/data/models/home_provider_model.dart';
import 'package:car_help/features/home_provider/domain/entities/home_provider_entity.dart';
import 'package:dio/dio.dart';

abstract class HomeProviderRemoteDataSource {
  Future<HomeProviderEntity> getHomeProvider();
  Future<String> sendOffer({
    String? offerType,
    int? orderId,
    double? price,
    String? description,
    double? lowPrice,
    double? highPrice,
    File? image,
  });
}

class HomeProviderRemoteDataSourceImpl extends HomeProviderRemoteDataSource {
  final ApiService apiService;
  HomeProviderRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<HomeProviderEntity> getHomeProvider() async {
    var response = await apiService.get(
      endPoint: EndPoints.getProviderHome,
    );
    HomeProviderEntity data = HomeProviderModel.fromJson(response['data']);

    return data;
  }

  @override
  Future<String> sendOffer({
    String? offerType,
    int? orderId,
    double? price,
    String? description,
    double? lowPrice,
    double? highPrice,
    File? image,
  }) async {
    FormData formData = FormData.fromMap({
      "offer_type": offerType,
      "order_id": orderId,
      if (price != null) "price": price,
      "description": description,
      if (lowPrice != null) "low_price": lowPrice,
      if (highPrice != null) "high_price": highPrice,
      if (image != null) "image": MultipartFile.fromFile(image.path),
    });
    var response = await apiService.post(
      endPoint: EndPoints.sendOffer,
      data: formData,
    );
    String message = response['message'];

    return message;
  }
}
