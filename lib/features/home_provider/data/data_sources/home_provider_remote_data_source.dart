import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/home_provider/data/models/home_provider_model.dart';
import 'package:car_help/features/home_provider/domain/entities/home_provider_entity.dart';

abstract class HomeProviderRemoteDataSource {
  Future<HomeProviderEntity> getHomeProvider();
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
}
