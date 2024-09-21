import 'package:car_help/features/auth/domain/entities/user_entities.dart';

class User extends UserEntity {
  User({
    super.id,
    super.userType,
    super.name,
    super.phone,
    super.profileImage,
    super.status,
    super.defaultLang,
    super.enableNotification,
    super.enableAdvertisementNotification,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        userType: json['user_type'] as String?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        profileImage: json['profile_image'] as String?,
        status: json['status'] as String?,
        defaultLang: json['default_lang'] as String?,
        enableNotification: json['enable_notification'] as int?,
        enableAdvertisementNotification:
            json['enable_advertisement_notification'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_type': userType,
        'name': name,
        'phone': phone,
        'profile_image': profileImage,
        'status': status,
        'default_lang': defaultLang,
        'enable_notification': enableNotification,
        'enable_advertisement_notification': enableAdvertisementNotification,
      };
}
