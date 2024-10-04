import 'dart:io';

import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/exhibits/data/models/exhibits_model.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:dio/dio.dart';

abstract class ExhibitsRemoteDataSource {
  Future<List<ExhibitsEntity>> getExhibits();
  Future<String> addExhibits({
    String? title,
    num? price,
    num? priceAfterDiscount,
    int? qty,
    String? description,
    List<File>? images,
  });
  Future<String> updateExhibits({
    int? id,
    String? title,
    num? price,
    num? priceAfterDiscount,
    int? qty,
    String? description,
    List<File>? images,
  });
  Future<String> deletaExhibits({int? id});
}

class ExhibitsRemoteDataSourceImpl extends ExhibitsRemoteDataSource {
  final ApiService apiService;
  ExhibitsRemoteDataSourceImpl(
    this.apiService,
  );
  @override
  Future<List<ExhibitsEntity>> getExhibits() async {
    var response = await apiService.get(endPoint: EndPoints.getExhibits);

    List<ExhibitsEntity> list = [];
    response['data'].forEach((element) {
      ExhibitsEntity model = ExhibitsModel.fromJson(element);
      list.add(model);
    });

    return list;
  }

  @override
  Future<String> addExhibits({
    String? title,
    num? price,
    num? priceAfterDiscount,
    int? qty,
    String? description,
    List<File>? images,
  }) async {
    List<MultipartFile> imagesFiles = [];
    if (images != null) {
      for (var file in images) {
        imagesFiles.add(await MultipartFile.fromFile(file.path));
      }
    }
    FormData formData = FormData.fromMap({
      'title': title,
      'images[]': imagesFiles,
      'price': price,
      'price_after_discount': priceAfterDiscount,
      'qty': qty,
      'description': description,
    });
    var response =
        await apiService.post(endPoint: EndPoints.getExhibits, data: formData);

    return response['message'];
  }

  @override
  Future<String> deletaExhibits({int? id}) async {
    var response =
        await apiService.delete(endPoint: '${EndPoints.deleteExhibits}$id');
    return response['message'];
  }

  @override
  Future<String> updateExhibits({
    int? id,
    String? title,
    num? price,
    num? priceAfterDiscount,
    int? qty,
    String? description,
    List<File>? images,
  }) async {
    List<MultipartFile> imagesFiles = [];
    if (images != null) {
      for (var file in images) {
        imagesFiles.add(await MultipartFile.fromFile(file.path));
      }
    }
    FormData formData = FormData.fromMap({
      'title': title,
      'images[]': imagesFiles,
      'price': price,
      'price_after_discount': priceAfterDiscount,
      'qty': qty,
      'description': description,
      '_method': 'PUT',
    });
    var response = await apiService.post(
        endPoint: '${EndPoints.updateExhibits}$id', data: formData);

    return response['message'];
  }
}
