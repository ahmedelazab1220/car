import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/home_client/data/model/provider_model.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';

abstract class FavoriteRemoteDataSource {
  Future<String> toggleFavorite({int? id});
  Future<List<ProviderEntity>> getFavorite();
}

class FavoriteRemoteDataSourceImpl extends FavoriteRemoteDataSource {
  final ApiService apiService;
  FavoriteRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<String> toggleFavorite({int? id}) async {
    var response = await apiService.put(
      endPoint: '${EndPoints.toggleFavorite}$id',
      data: null,
    );

    return response['message'];
  }

  @override
  Future<List<ProviderEntity>> getFavorite() async {
    var response = await apiService.get(
      endPoint: EndPoints.getFavorite,
    );
    List<ProviderEntity> list = [];
    response['data'].forEach((element) {
      ProviderEntity model = ProviderModel.fromJson(element);
      list.add(model);
    });
    return list;
  }
}
