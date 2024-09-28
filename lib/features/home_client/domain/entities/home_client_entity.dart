import 'package:car_help/features/home_client/domain/entities/banner_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';

class HomeClientEntity {
  List<BannerEntity>? banners;
  List<ProviderEntity>? providers;
  HomeClientEntity({
    this.banners,
    this.providers,
  });
}
