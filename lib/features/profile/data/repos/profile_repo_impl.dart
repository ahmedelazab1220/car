import 'dart:io';

import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/profile/data/data%20sourses/profile_local_data_source.dart';
import 'package:car_help/features/profile/data/data%20sourses/profile_remote_data_source.dart';
import 'package:car_help/features/profile/domain/repos/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;
  ProfileRepoImpl({
    required this.profileRemoteDataSource,
    required this.profileLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> getProfileData(
      {bool remote = false}) async {
    try {
      UserEntity? data;
      if (remote) {
        data = await profileRemoteDataSource.getProfileData();
        return right(data);
      } else {
        data = await profileLocalDataSource.getProfileData();
        if (data != null) {
          return right(data);
        }
        data = await profileRemoteDataSource.getProfileData();
        return right(data);
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> editProfileData(
      {String? name,
      String? phone,
      String? address,
      String? commercialRegister,
      int? cityId,
      int? districtId,
      double? lat,
      double? lng,
      List<int>? categoryIds,
      List<File>? works}) async {
    try {
      String data;
      data = await profileRemoteDataSource.editProfileData(
          name: name,
          phone: phone,
          address: address,
          commercialRegister: commercialRegister,
          cityId: cityId,
          districtId: districtId,
          lat: lat,
          lng: lng,
          categoryIds: categoryIds,
          works: works);
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
  Future<Either<Failure, String>> deleteAccount() async {
    try {
      var data = await profileRemoteDataSource.deleteAccount();
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
  Future<Either<Failure, String>> sendOtpEditPhone({String? phone}) async {
    try {
      var data = await profileRemoteDataSource.sendOtpEditPhone(
        phone: phone,
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
  Future<Either<Failure, String>> verifyOtpEditPhone(
      {String? phone, String? otpCode}) async {
    try {
      var data = await profileRemoteDataSource.verifyOtpEditPhone(
          phone: phone, otpCode: otpCode);
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
  Future<Either<Failure, String?>> toggleNotification(
      {int? enableNotification, int? enableAdvertisement}) async {
    try {
      String data;
      data = await profileRemoteDataSource.toggleNotification(
        enableNotification: enableNotification,
        enableAdvertisement: enableAdvertisement,
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
  Future<Either<Failure, String?>> toggleLanguage({String? language}) async {
    try {
      String data;
      data = await profileRemoteDataSource.toggleLanguage(language: language);
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
