import 'package:car_help/features/home_client/data/model/banner_model.dart';
import 'package:car_help/features/home_client/data/model/provider_model.dart';
import 'package:car_help/features/home_client/domain/entities/home_client_entity.dart';

class HomeClientModel extends HomeClientEntity {
  HomeClientModel({super.banners, super.providers});

  factory HomeClientModel.fromJson(Map<String, dynamic> json) =>
      HomeClientModel(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        providers: (json['providers'] as List<dynamic>?)
            ?.map((e) => ProviderModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'banners': banners,
        'providers': providers,
      };
}
