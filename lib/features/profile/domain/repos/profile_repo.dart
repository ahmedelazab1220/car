import 'dart:io';

import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> getProfileData({bool remote});
  Future<Either<Failure, String>> editProfileData({
 String? name,
    String? phone,
    String? address,
    String? commercialRegister,
    int? cityId,
    int? districtId,
    double? lat,
    double? lng,
    List<int>? categoryIds,
    List<File>? works
  });
  Future<Either<Failure, String>> sendOtpEditPhone({
    String? phone,
  });
  Future<Either<Failure, String>> verifyOtpEditPhone({
    String? phone,
    String? otpCode,
  });
  Future<Either<Failure, String>> deleteAccount();
  Future<Either<Failure, String?>> toggleNotification(
      {int? enableNotification, int? enableAdvertisement});
  Future<Either<Failure, String?>> toggleLanguage({String? language});
}
