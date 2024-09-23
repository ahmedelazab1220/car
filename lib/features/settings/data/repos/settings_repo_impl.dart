import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/settings/data/data%20sourses/settings_remote_data_source.dart';
import 'package:car_help/features/settings/domain/entites/contact_information_entity.dart';
import 'package:car_help/features/settings/domain/entites/faq_entity.dart';
import 'package:car_help/features/settings/domain/entites/info_entity.dart';
import 'package:car_help/features/settings/domain/repos/settings_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SettingsRepoImpl extends SettingsRepo {
  final SettingsRemoteDataSource settingsRemoteDataSource;

  SettingsRepoImpl({required this.settingsRemoteDataSource});
  @override
  Future<Either<Failure, InfoEntity>> getPrivacyPolicy() async {
    try {
      InfoEntity data = await settingsRemoteDataSource.getPrivacyPolicy();
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
  Future<Either<Failure, InfoEntity>> getAboutUs() async {
    try {
      InfoEntity data = await settingsRemoteDataSource.getAboutUs();
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
  Future<Either<Failure, InfoEntity>> getTermsAndConditions() async {
    try {
      InfoEntity data = await settingsRemoteDataSource.getTermsAndConditions();
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
  Future<Either<Failure, String>> posrContactUs({
    String? name,
    String? phone,
    String? email,
    int? problemId,
    String? message,
  }) async {
    try {
      String data = await settingsRemoteDataSource.posrContactUs(
        name: name,
        phone: phone,
        email: email,
        message: message,
        problemId: problemId,
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
  Future<Either<Failure, ContactInformationEntity>>
      getContactInformation() async {
    try {
      ContactInformationEntity data =
          await settingsRemoteDataSource.getContactInformation();
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
  Future<Either<Failure, List<FaqEntity>>> getFAQ() async {
    try {
      List<FaqEntity> data = await settingsRemoteDataSource.getFAQ();
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
