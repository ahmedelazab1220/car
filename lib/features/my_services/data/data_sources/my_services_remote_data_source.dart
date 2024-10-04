import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/orders/data/models/order_model/order_model.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';

abstract class MyServicesRemoteDataSource {
  Future<List<OrderEntity>> getMyService();
}

class MyServicesRemoteDataSourceImpl extends MyServicesRemoteDataSource {
  final ApiService apiService;
  MyServicesRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<List<OrderEntity>> getMyService() async {
    var response = await apiService.get(endPoint: EndPoints.getMyServices);

    List<OrderEntity> list = [];
    response['data'].forEach((element) {
      OrderEntity model = OrderModel.fromJson(element);
      list.add(model);
    });

    return list;
  }
}
