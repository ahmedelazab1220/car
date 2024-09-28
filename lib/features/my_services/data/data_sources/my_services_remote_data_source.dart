import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/my_services/data/models/my_services_model.dart';
import 'package:car_help/features/my_services/domain/entities/my_services_entity.dart';

abstract class MyServicesRemoteDataSource {
  Future<List<MyServicesEntity>> getMyService();
}

class MyServicesRemoteDataSourceImpl extends MyServicesRemoteDataSource {
  final ApiService apiService;
  MyServicesRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<List<MyServicesEntity>> getMyService() async {
    var response = await apiService.get(endPoint: EndPoints.getMyServices);

    List<MyServicesEntity> list = [];
    response['data'].forEach((element) {
      MyServicesEntity model = MyServicesModel.fromJson(element);
      list.add(model);
    });

    return list;
  }
}
