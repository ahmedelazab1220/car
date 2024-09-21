import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/core/api/end_points.dart';
import 'package:car_help/features/settings/data/models/faq_model.dart';
import 'package:car_help/features/settings/data/models/information_model/contact_information_model.dart';
import 'package:car_help/features/settings/domain/entites/contact_information_entity.dart';
import 'package:car_help/features/settings/domain/entites/faq_entity.dart';
import 'package:car_help/features/settings/domain/entites/info_entity.dart';

import '../models/information_model/data.dart';

abstract class SettingsRemoteDataSource {
  Future<InfoEntity> getPrivacyPolicy();
  Future<InfoEntity> getTermsAndConditions();
  Future<List<FaqEntity>> getFAQ();
  Future<InfoEntity> getAboutUs();
  Future<ContactInformationEntity> getContactInformation();

  Future<String> posrContactUs({
    String? name,
    String? phone,
    String? address,
    String? message,
  });
}

class SettingsRemoteDataSourceImpl extends SettingsRemoteDataSource {
  final ApiService apiService;

  SettingsRemoteDataSourceImpl(this.apiService);
  @override
  Future<InfoEntity> getPrivacyPolicy() async {
    var data = await apiService.get(
      endPoint: EndPoints.getPrivacyPolicy,
    );
    InfoEntity info = Data.fromJson(data['data']);

    return info;
  }

  @override
  Future<InfoEntity> getAboutUs() async {
    var data = await apiService.get(
      endPoint: EndPoints.getAboutUs,
    );
    InfoEntity info = Data.fromJson(data['data']);
    return info;
  }

  @override
  Future<InfoEntity> getTermsAndConditions() async {
    var data = await apiService.get(
      endPoint: EndPoints.getTermsAndConditions,
    );
    InfoEntity info = Data.fromJson(data['data']);
    return info;
  }

  @override
  Future<ContactInformationEntity> getContactInformation() async {
    var data = await apiService.get(
      endPoint: EndPoints.getContactUs,
    );
    ContactInformationEntity info =
        ContactInformationModel.fromJson(data['data']);
    return info;
  }

  @override
  Future<String> posrContactUs(
      {String? name, String? phone, String? address, String? message}) async {
    var data = await apiService.post(
      endPoint: EndPoints.contactUs,
      data: {
        "name": name,
        "phone": phone,
        "address": address,
        "message": message,
      },
    );
    String response = data['message'];
    return response;
  }

  @override
  Future<List<FaqEntity>> getFAQ() async {
    var data = await apiService.get(
      endPoint: EndPoints.getFAQ,
    );
    List<FaqEntity> list = [];
    data['data'].forEach((element) {
      FaqEntity model = FaqModel.fromJson(element);
      list.add(model);
    });

    return list;
  }
}
