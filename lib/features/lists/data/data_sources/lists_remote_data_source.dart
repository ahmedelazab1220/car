import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/lists/data/models/dropdown.model.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';

abstract class ListsRemoteDataSource {
  Future<List<DropDownEntity>> getCities();
  // Future<List<DropDownEntity>> getCountries();
  Future<List<DropDownEntity>> getDistricts({int? id});
  Future<List<DropDownEntity>> getCarModels();
  Future<List<DropDownEntity>> getProblemTypes();
  Future<List<DropDownEntity>> getCarFactories();
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
      endPoint: EndPoints.getCarModels,
    );

    List<DropDownEntity> list = [];
    response['data'].forEach((element) {
      DropDownEntity model = DropDownModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  // @override
  // Future<List<DropDownEntity>> getCountries() async {
  //   var response = await apiService.get(
  //     endPoint: EndPoints.cities,
  //   );

  //   List<DropDownEntity> list = [];
  //   response['data'].forEach((element) {
  //     DropDownEntity model = DropDownModel.fromJson(element);
  //     list.add(model);
  //   });

  //   return list;
  // }

  @override
  Future<List<DropDownEntity>> getDistricts({int? id}) async {
    var response = await apiService.get(
      endPoint: '${EndPoints.cities}/$id',
    );

    List<DropDownEntity> list = [];
    response['data']['districts'].forEach((element) {
      DropDownEntity model = DropDownModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<List<DropDownEntity>> getProblemTypes() async {
    var response = await apiService.get(
      endPoint: EndPoints.getProblemTypes,
    );

    List<DropDownEntity> list = [];
    response['data'].forEach((element) {
      DropDownEntity model = DropDownModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<List<DropDownEntity>> getCarFactories() async {
    var response = await apiService.get(
      endPoint: EndPoints.getCarFactories,
    );

    List<DropDownEntity> list = [];
    response['data'].forEach((element) {
      DropDownEntity model = DropDownModel.fromJson(element);
      list.add(model);
    });

    return list;
  }
}
