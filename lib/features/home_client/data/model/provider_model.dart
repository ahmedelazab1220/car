import 'package:car_help/features/exhibits/data/models/exhibits_model.dart';
import 'package:car_help/features/home_client/data/model/service_model.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/lists/data/models/dropdown.model.dart';
import 'package:car_help/features/orders/data/models/provider_times_model.dart';

class ProviderModel extends ProviderEntity {
  ProviderModel({
    super.id,
    super.name,
    super.phone,
    super.address,
    super.lat,
    super.lng,
    super.about,
    super.distance,
    super.city,
    super.district,
    super.profileImage,
    super.backgroundImage,
    super.categories,
    super.averageRate,
    super.inWishlist,
    super.gallery,
    super.exhibits,
    super.workingDays,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
        about: json['about'] as String?,
        distance: json['distance'] as dynamic,
        city: json['city'] == null
            ? null
            : DropDownModel.fromJson(json['city'] as Map<String, dynamic>),
        district: json['district'] == null
            ? null
            : DropDownModel.fromJson(json['district'] as Map<String, dynamic>),
        profileImage: json['profile_image'] as String?,
        backgroundImage: json['background_image'] as String?,
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        averageRate: json['average_rate'] as num?,
        inWishlist: json['in_wishlist'] as bool?,
        gallery: (json['gallery'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        exhibits: (json['services'] as List<dynamic>?)
            ?.map((e) => ExhibitsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        workingDays: (json['working_days'] as List<dynamic>?)
            ?.map((e) => ProviderTimesModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
        'address': address,
        'lat': lat,
        'lng': lng,
        'about': about,
        'distance': distance,
        'city': city,
        'district': district,
        'profile_image': profileImage,
        'background_image': backgroundImage,
        'categories': categories,
        'average_rate': averageRate,
        'in_wishlist': inWishlist,
        'gallery': gallery,
        'services': exhibits,
        'working_days': workingDays,
      };
}
