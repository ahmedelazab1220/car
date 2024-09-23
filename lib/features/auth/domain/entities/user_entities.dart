import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';

class UserEntity {
  int? id;
  String? userType;
  String? name;
  String? phone;
  String? address;
  double? lat;
  double? lng;
  String? commercialRegister;
  dynamic about;
  DropDownEntity? city;
  DropDownEntity? district;
  List<ServiceEntity>? categories;
  String? profileImage;
  String? status;
  String? defaultLang;
  int? enableNotification;
  int? enableAdvertisementNotification;

  UserEntity({
    this.id,
    this.userType,
    this.name,
    this.phone,
    this.address,
    this.lat,
    this.lng,
    this.commercialRegister,
    required this.about,
    this.city,
    this.district,
    this.categories,
    this.profileImage,
    this.status,
    this.defaultLang,
    this.enableNotification,
    this.enableAdvertisementNotification,
  });
}
