import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/lists/data/models/dropdown.model.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';

abstract class ListsRemoteDataSource {
  Future<List<DropDownEntity>> getCities();
  Future<List<DropDownEntity>> getCountries();
  Future<List<DropDownEntity>> getDistricts();
  Future<List<DropDownEntity>> getCarModels();
  Future<List<DropDownEntity>> getProblemTypes();
}

class ListsRemoteDataSourceImpl extends ListsRemoteDataSource {
  final ApiService apiService;
  ListsRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<List<DropDownEntity>> getCities() async {
    var response = await apiService.get(
      endPoint: EndPoints.cities,
    );

    List<DropDownEntity> list = [];
    response['data'].forEach((element) {
      DropDownEntity model = DropDownModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<List<DropDownEntity>> getCarModels() async {
    var response = await apiService.get(
      endPoint: EndPoints.cities,
    );

    List<DropDownEntity> list = [];
    response['data'].forEach((element) {
      DropDownEntity model = DropDownModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<List<DropDownEntity>> getCountries() async {
    var response = await apiService.get(
      endPoint: EndPoints.cities,
    );

    List<DropDownEntity> list = [];
    response['data'].forEach((element) {
      DropDownEntity model = DropDownModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<List<DropDownEntity>> getDistricts() async {
    var response = await apiService.get(
      endPoint: EndPoints.distracts,
    );

    List<DropDownEntity> list = [];
    response['data'].forEach((element) {
      DropDownEntity model = DropDownModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<List<DropDownEntity>> getProblemTypes() async {
    var response = await apiService.get(
      endPoint: EndPoints.cities,
    );

    List<DropDownEntity> list = [];
    response['data'].forEach((element) {
      DropDownEntity model = DropDownModel.fromJson(element);
      list.add(model);
    });

    return list;
  }
}
