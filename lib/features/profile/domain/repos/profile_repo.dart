import 'dart:io';

import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserEntity>> getProfileData({bool remote});
  Future<Either<Failure, String>> editProfileData({
    String? name,
    String? email,
    File? profileImage,
    File? cv,
    List<File>? works,
    List<int>? categoryId,
    String? phone,
    String? accountType,
    String? experienceYears,
    String? url,
    String? about,
    List<int>? programs,
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
}
