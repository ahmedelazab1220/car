import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/home_provider/data/data_sources/home_provider_remote_data_source.dart';
import 'package:car_help/features/home_provider/domain/entities/home_provider_entity.dart';
import 'package:car_help/features/home_provider/domain/repos/home_provider_repo.dart';
import 'package:dio/dio.dart';

class HomeProvierRepoImpl extends HomeProviderRepo {
  final HomeProviderRemoteDataSource homeProviderRemoteDataSource;
  HomeProvierRepoImpl({
    required this.homeProviderRemoteDataSource,
  });
  @override
  Future<Either<Failure, HomeProviderEntity>> getHomeProvider() async {
    try {
      HomeProviderEntity data =
          await homeProviderRemoteDataSource.getHomeProvider();
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> sendOffer({
    String? offerType,
    int? orderId,
    double? price,
    String? description,
    double? lowPrice,
    double? highPrice,
    File? image,
  }) async {
    try {
      final data = await homeProviderRemoteDataSource.sendOffer(
        offerType: offerType,
        orderId: orderId,
        price: price,
        description: description,
        lowPrice: lowPrice,
        highPrice: highPrice,
        image: image,
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
