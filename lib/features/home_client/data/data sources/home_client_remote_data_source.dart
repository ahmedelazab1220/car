import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/home_client/data/model/home_client_model.dart';
import 'package:car_help/features/home_client/data/model/provider_model.dart';
import 'package:car_help/features/home_client/data/model/service_model.dart';
import 'package:car_help/features/home_client/domain/entities/home_client_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';

abstract class HomeClientRemoteDataSource {
  Future<HomeClientEntity> getHome({String? lat, String? lng});
  Future<List<ServiceEntity>> getServices();

  Future<ProviderEntity> getProvider({int? providerId});
  Future<List<ProviderEntity>> search({int? categoryId, String? query});
}

class HomeRemoteDataSourceImpl extends HomeClientRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(
    this.apiService,
  );

  @override
  Future<HomeClientEntity> getHome({String? lat, String? lng}) async {
    String? location = lat != null && lng != null ? '?lat=$lat&lng=$lng' : '';
    var response = await apiService.get(
      endPoint: '${EndPoints.getClientHome}$location',
    );
    HomeClientEntity data = HomeClientModel.fromJson(response['data']);

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

  @override
  Future<ProviderEntity> getProvider({int? providerId}) async {
    var response = await apiService.get(
      endPoint: '${EndPoints.getProvider}$providerId',
    );
    ProviderEntity data = ProviderModel.fromJson(response['data']);
    return data;
  }

  @override
  Future<List<ProviderEntity>> search({int? categoryId, String? query}) async {
    var response = await apiService.get(
      endPoint:
          '${EndPoints.getProviders}category_id=$categoryId&search=$query',
    );
    List<ProviderEntity> list = [];
    response['data'].forEach((element) {
      ProviderEntity model = ProviderModel.fromJson(element);
      list.add(model);
    });

    return list;
  }
}
