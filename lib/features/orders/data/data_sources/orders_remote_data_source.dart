import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/orders/data/models/order_model/order_model.dart';
import 'package:car_help/features/orders/data/models/provider_times_model.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';

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
  });
  Future<String> cancelOrder({int? orderId});
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
      "order_status": orderStatuse, // pending,in-progress,completed,canceled
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
  Future<String> addOrder(
      {String? orderType,
      int? providerId,
      String? orderDate,
      String? orderFromTime,
      String? orderToTime,
      String? paymentMethod}) async {
    var response = await apiService.post(
      endPoint: EndPoints.getMyOrders,
      data: {
        "order_type": orderType, // exhibited,public,private
        "provider_id": providerId,
        "order_date": orderDate,
        "order_from_time": orderFromTime,
        "order_to_time": "orderToTime",
        "payment_method": paymentMethod, // card,cash
      },
    );

    return response['data'];
  }

  @override
  Future<String> cancelOrder({int? orderId}) async {
    var response = await apiService.put(
      endPoint: '${EndPoints.getMyOrders}$orderId',
      data: null,
    );

    return response['data'];
  }
}
