import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> login({String? email, String? password});
  Future<Either<Failure, String>> sendOtpCode({String? phone});
  Future<Either<Failure, String>> changePassword(
      {String? oldPassword,
      String? newPassword,
      String? newPasswordConfirmation});

  Future<Either<Failure, UserEntity>> otpVerification(
      {String? phone, String? otpCode});
  Future<Either<Failure, String>> logout();
  Future<Either<Failure, String>> deleteAccount();
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
    double? lat,
    double? lng,
    List<int>? categoryIds,
  });

  Future<Either<Failure, String>> editPhoneNumber({
    String? phone,
    int? userId,
  });
}
