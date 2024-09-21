import 'package:car_help/features/home_client/data/model/banner_model.dart';
import 'package:car_help/features/home_client/data/model/provider_model.dart';
import 'package:car_help/features/home_client/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel({super.banners, super.providers});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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
