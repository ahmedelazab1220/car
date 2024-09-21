import 'package:car_help/features/home_client/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    super.id,
    super.name,
    super.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
