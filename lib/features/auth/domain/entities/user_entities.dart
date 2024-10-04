import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';

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
  String? backgroundImage;
  String? status;
  String? defaultLang;
  int? enableNotification;
  int? enableAdvertisementNotification;
  List<String>? gallery;
  List<ExhibitsEntity>? exhibits;
  List<ProviderTimesEntity>? workingDays;

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
    this.backgroundImage,
    this.status,
    this.defaultLang,
    this.enableNotification,
    this.enableAdvertisementNotification,
    this.gallery,
    this.exhibits,
    this.workingDays,
  });
}
