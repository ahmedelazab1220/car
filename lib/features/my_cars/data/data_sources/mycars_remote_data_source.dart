import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/my_cars/data/models/my_car_model/my_car_model.dart';
import 'package:car_help/features/my_cars/doman/entities/mycars_entity.dart';

abstract class MyCarsRemoteDataSource {
  Future<List<MyCarsEntity>> getMyCars();
  Future<String> addMyCar(
      {int? carFactoryId, int? carModelId, String? manufactureYear});
  Future<String> updateMyCar(
      {int? carFactoryId, int? carModelId, String? manufactureYear});
  Future<String> deleteMyCar({int? id});
}

class MyCarsRemoteDataSourceImpl extends MyCarsRemoteDataSource {
  final ApiService apiService;
  MyCarsRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<String> addMyCar(
      {int? carFactoryId, int? carModelId, String? manufactureYear}) async {
    var response = await apiService.post(endPoint: EndPoints.addMyCar, data: {
      "car_factory_id": carFactoryId,
      "car_model_id": carModelId,
      "manufacture_year": manufactureYear
    });

    return response['message'];
  }

  @override
  Future<String> deleteMyCar({int? id}) async {
    var response =
        await apiService.delete(endPoint: '${EndPoints.deleteMyCar}$id');
    return response['message'];
  }

  @override
  Future<List<MyCarsEntity>> getMyCars() async {
    var response = await apiService.get(endPoint: EndPoints.getMyCars);
    List<MyCarsEntity> list = [];

    response['data'].forEach((element) {
      MyCarsEntity model = MyCarModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<String> updateMyCar(
      {int? carFactoryId, int? carModelId, String? manufactureYear}) async {
    var response =
        await apiService.post(endPoint: EndPoints.updateMyCar, data: {
      "car_factory_id": carFactoryId,
      "car_model_id": carModelId,
      "manufacture_year": manufactureYear
    });
    return response['message'];
  }
}
