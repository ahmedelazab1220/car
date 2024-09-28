import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/exhibits/data/models/exhibits_model.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';

abstract class ExhibitsRemoteDataSource {
  Future<List<ExhibitsEntity>> getExhibits();
  Future<String> addExhibits();
  Future<String> updateExhibits();
  Future<String> deletaExhibits({int? id});
}

class ExhibitsRemoteDataSourceImpl extends ExhibitsRemoteDataSource {
  final ApiService apiService;
  ExhibitsRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<List<ExhibitsEntity>> getExhibits() async {
    var response = await apiService.get(endPoint: EndPoints.getMyServices);

    List<ExhibitsEntity> list = [];
    response['data'].forEach((element) {
      ExhibitsEntity model = ExhibitsModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<String> addExhibits() {
    // TODO: implement addExhibits
    throw UnimplementedError();
  }

  @override
  Future<String> deletaExhibits({int? id}) async {
    var response =
        await apiService.delete(endPoint: '${EndPoints.deleteExhibits}$id');
    return response['message'];
  }

  @override
  Future<String> updateExhibits() {
    // TODO: implement updateExhibits
    throw UnimplementedError();
  }
}
