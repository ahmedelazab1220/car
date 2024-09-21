import 'package:car_help/core/api/failures.dart';
import 'package:car_help/features/settings/domain/entites/contact_information_entity.dart';
import 'package:car_help/features/settings/domain/entites/faq_entity.dart';
import 'package:car_help/features/settings/domain/entites/info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SettingsRepo {
  Future<Either<Failure, InfoEntity>> getPrivacyPolicy();
  Future<Either<Failure, InfoEntity>> getTermsAndConditions();
  Future<Either<Failure, InfoEntity>> getAboutUs();
  Future<Either<Failure, List<FaqEntity>>> getFAQ();

  Future<Either<Failure, ContactInformationEntity>> getContactInformation();

  Future<Either<Failure, String>> posrContactUs({
    String? name,
    String? phone,
    String? address,
    String? message,
  });
}
