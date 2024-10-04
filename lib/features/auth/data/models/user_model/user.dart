import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/exhibits/data/models/exhibits_model.dart';
import 'package:car_help/features/home_client/data/model/service_model.dart';
import 'package:car_help/features/lists/data/models/dropdown.model.dart';
import 'package:car_help/features/orders/data/models/provider_times_model.dart';

class User extends UserEntity {
  User({
    super.id,
    super.userType,
    super.name,
    super.phone,
    super.address,
    super.lat,
    super.lng,
    super.commercialRegister,
    super.about,
    super.city,
    super.district,
    super.categories,
    super.profileImage,
    super.backgroundImage,
    super.status,
    super.defaultLang,
    super.enableNotification,
    super.enableAdvertisementNotification,
    super.gallery,
    super.exhibits,
    super.workingDays,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        userType: json['user_type'] as String?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
        lat: (json['lat'] as num?)?.toDouble(),
        lng: (json['lng'] as num?)?.toDouble(),
        commercialRegister: json['commercial_register'] as String?,
        about: json['about'] as dynamic,
        city: json['city'] == null
            ? null
            : DropDownModel.fromJson(json['city'] as Map<String, dynamic>),
        district: json['district'] == null
            ? null
            : DropDownModel.fromJson(json['district'] as Map<String, dynamic>),
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        profileImage: json['profile_image'] as String?,
        backgroundImage: json['background_image'] as String?,
        status: json['status'] as String?,
        defaultLang: json['default_lang'] as String?,
        enableNotification: json['enable_notification'] as int?,
        enableAdvertisementNotification:
            json['enable_advertisement_notification'] as int?,
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
        'user_type': userType,
        'name': name,
        'phone': phone,
        'address': address,
        'lat': lat,
        'lng': lng,
        'commercial_register': commercialRegister,
        'about': about,
        'city': city,
        'district': district,
        'categories': categories,
        'profile_image': profileImage,
        'background_image': backgroundImage,
        'status': status,
        'default_lang': defaultLang,
        'enable_notification': enableNotification,
        'enable_advertisement_notification': enableAdvertisementNotification,
        'gallery': gallery,
        'services': exhibits,
        'working_days': workingDays,
      };
}
