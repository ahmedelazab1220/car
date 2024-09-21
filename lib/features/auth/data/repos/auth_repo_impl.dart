import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
      {String? email, String? password}) async {
    try {
      UserEntity data =
          await authRemoteDataSource.login(phone: email, password: password);
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
  Future<Either<Failure, String>> sendOtpCode({String? phone}) async {
    try {
      var data = await authRemoteDataSource.sendOtpCode(
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
  Future<Either<Failure, UserEntity>> otpVerification(
      {String? phone, String? otpCode}) async {
    try {
      UserEntity data = await authRemoteDataSource.otpVerification(
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
  Future<Either<Failure, UserEntity>> register({
    String? userType,
    String? name,
    String? phone,
    String? password,
    String? passwordConfirmation,
    String? address,
    String? commercialRegister,
    int? cityId,
    int? districtId,
    int? lat,
    int? lng,
  }) async {
    try {
      var data = await authRemoteDataSource.register(
        userType: userType,
        name: name,
        phone: phone,
        password: password,
        passwordConfirmation: passwordConfirmation,
        address: address,
        commercialRegister: commercialRegister,
        cityId: cityId,
        districtId: districtId,
        lat: lat,
        lng: lng,
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
  Future<Either<Failure, String>> logout() async {
    try {
      var data = await authRemoteDataSource.logout();
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
  Future<Either<Failure, String>> editPhoneNumber(
      {String? phone, int? userId}) async {
    try {
      var data = await authRemoteDataSource.updatephoneNumber(
        phone: phone,
        userId: userId,
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
  Future<Either<Failure, String>> deleteAccount() async {
    try {
      var data = await authRemoteDataSource.deleteAccount();
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
