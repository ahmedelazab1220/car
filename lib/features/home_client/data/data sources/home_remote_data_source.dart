import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/home_client/data/model/home_model.dart';
import 'package:car_help/features/home_client/data/model/provider_model.dart';
import 'package:car_help/features/home_client/data/model/service_model.dart';
import 'package:car_help/features/home_client/domain/entities/home_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';

abstract class HomeRemoteDataSource {
  Future<HomeEntity> getHome();
  Future<List<ServiceEntity>> getServices();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(
    this.apiService,
  );

  @override
  Future<HomeEntity> getHome() async {
    var response = await apiService.get(
      endPoint: EndPoints.getHome,
    );
    HomeEntity data = HomeModel.fromJson(response['data']);

    return data;
  }

  @override
  Future<List<ServiceEntity>> getServices() async {
    var response = await apiService.get(
      endPoint: EndPoints.getServices,
    );

    List<ServiceEntity> list = [];
    response['data'].forEach((element) {
      ServiceEntity model = ServiceModel.fromJson(element);
      list.add(model);
    });
    CacheHelper().cacheListData(
      List<Map<String, dynamic>>.from(response['data']),
      AppStrings.services,
    );
    return list;
  }
}
