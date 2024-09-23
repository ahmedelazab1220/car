import 'package:dartz/dartz.dart';

import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/addresses/data/data_sources/addresses_remote_data_source.dart';
import 'package:car_help/features/addresses/domain/entities/address_entity.dart';
import 'package:car_help/features/addresses/domain/repos/addresses_repo.dart';
import 'package:dio/dio.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AddressesRepoImpl extends AddressesRepo {
  final AddressesRemoteDataSource addressesRemoteDataSource;
  AddressesRepoImpl({
    required this.addressesRemoteDataSource,
  });
  @override
  Future<Either<Failure, String>> addAddress(AddressEntity address) async {
    try {
      String data = await addressesRemoteDataSource.addAddress(
        address,
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

  @override
  Future<Either<Failure, String>> deleteAddress(int? id) async {
    try {
      String data = await addressesRemoteDataSource.deleteAddress(id);
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
  Future<Either<Failure, List<AddressEntity>>> getAddresses() async {
    try {
      List<AddressEntity> data = await addressesRemoteDataSource.getAddresses();
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
  Future<Either<Failure, String>> updateAddress(AddressEntity address) async {
    try {
      String data = await addressesRemoteDataSource.updateAddress(
        address,
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
