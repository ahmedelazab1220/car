// import 'category.dart';
// import 'city.dart';
// import 'district.dart';

// class UserModel {

//   UserModel({
//     this.id,
//     this.userType,
//     this.name,
//     this.phone,
//     this.address,
//     this.lat,
//     this.lng,
//     this.commercialRegister,
//     this.about,
//     this.city,
//     this.district,
//     this.categories,
//     this.profileImage,
//     this.status,
//     this.defaultLang,
//     this.enableNotification,
//     this.enableAdvertisementNotification,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json['id'] as int?,
//         userType: json['user_type'] as String?,
//         name: json['name'] as String?,
//         phone: json['phone'] as String?,
//         address: json['address'] as String?,
//         lat: (json['lat'] as num?)?.toDouble(),
//         lng: (json['lng'] as num?)?.toDouble(),
//         commercialRegister: json['commercial_register'] as String?,
//         about: json['about'] as dynamic,
//         city: json['city'] == null
//             ? null
//             : City.fromJson(json['city'] as Map<String, dynamic>),
//         district: json['district'] == null
//             ? null
//             : District.fromJson(json['district'] as Map<String, dynamic>),
//         categories: (json['categories'] as List<dynamic>?)
//             ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         profileImage: json['profile_image'] as String?,
//         status: json['status'] as String?,
//         defaultLang: json['default_lang'] as String?,
//         enableNotification: json['enable_notification'] as int?,
//         enableAdvertisementNotification:
//             json['enable_advertisement_notification'] as int?,
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'user_type': userType,
//         'name': name,
//         'phone': phone,
//         'address': address,
//         'lat': lat,
//         'lng': lng,
//         'commercial_register': commercialRegister,
//         'about': about,
//         'city': city?.toJson(),
//         'district': district?.toJson(),
//         'categories': categories?.map((e) => e.toJson()).toList(),
//         'profile_image': profileImage,
//         'status': status,
//         'default_lang': defaultLang,
//         'enable_notification': enableNotification,
//         'enable_advertisement_notification': enableAdvertisementNotification,
//       };
// }
