import 'dart:io';

import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/orders/data/models/order_model/order_model.dart';
import 'package:car_help/features/orders/data/models/provider_times_model.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';
import 'package:dio/dio.dart';

abstract class OrdersRemoteDataSource {
  Future<List<ProviderTimesEntity>> getProviderTimes(
      {int? providerId, String? orderDate});

  Future<List<OrderEntity>> getMyOrders(
      {String? orderStatuse, String? orderType});
  Future<String> addOrder({
    String? orderType,
    int? providerId,
    String? orderDate,
    String? orderFromTime,
    String? orderToTime,
    String? paymentMethod,
    List<File>? orderFiles,
    int? categoryId,
    int? addressId,
    int? carId,
  });
  Future<String> cancelOrder({int? orderId, String? reason});
}

class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource {
  final ApiService apiService;

  OrdersRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProviderTimesEntity>> getProviderTimes(
      {int? providerId, String? orderDate}) async {
    var response = await apiService.get(
      endPoint: EndPoints.getProviderTimes,
      data: {
        "provider_id": providerId,
        "order_date": orderDate,
      },
    );

    List<ProviderTimesEntity> list = [];
    response['data'].forEach((element) {
      ProviderTimesEntity model = ProviderTimesModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<List<OrderEntity>> getMyOrders(
      {String? orderStatuse, String? orderType}) async {
    var response = await apiService.get(endPoint: EndPoints.getMyOrders, data: {
      // "order_status": orderStatuse, // pending,in-progress,completed,canceled
      "order_type": orderType, // exhibited,public,private
    });

    List<OrderEntity> list = [];
    response['data'].forEach((element) {
      OrderEntity model = OrderModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<String> addOrder({
    String? orderType,
    int? providerId,
    String? orderDate,
    String? orderFromTime,
    String? orderToTime,
    String? paymentMethod,
    List<File>? orderFiles,
    int? categoryId,
    int? addressId,
    int? carId,
  }) async {
    List<MultipartFile> orderFilesList = [];
    if (orderFiles != null) {
      for (var file in orderFiles) {
        orderFilesList.add(await MultipartFile.fromFile(file.path));
      }
    }
    FormData formData = FormData.fromMap({
      "order_type": orderType, // exhibited,public,private
      if (providerId != null) "provider_id": providerId,
      if (orderDate != null) "order_date": orderDate,
      if (orderFromTime != null) "order_from_time": orderFromTime,
      if (orderToTime != null) "order_to_time": orderToTime,
      "payment_method": paymentMethod, // card,cash
      if (orderFilesList.isNotEmpty) "order_files[]": orderFilesList,
      if (categoryId != null) "category_id": categoryId,
      if (addressId != null) "user_address_id": addressId,
      if (carId != null) "user_car_id": carId,
    });
    var response = await apiService.post(
      endPoint: EndPoints.getMyOrders,
      data: formData,
    );

    return response['message'];
  }

  @override
  Future<String> cancelOrder({int? orderId, String? reason}) async {
    var response = await apiService.put(
      endPoint: '${EndPoints.cancelMyOrder}$orderId',
      data: {
        "cancel_reason": reason,
      },
    );

    return response['message'];
  }
}
