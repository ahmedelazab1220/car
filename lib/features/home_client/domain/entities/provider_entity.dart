import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';

class ProviderEntity {
  int? id;
  String? name;
  String? phone;
  String? address;
  double? lat;
  double? lng;
  String? about;
  dynamic distance;
  DropDownEntity? city;
  DropDownEntity? district;
  String? profileImage;
  String? backgroundImage;
  List<ServiceEntity>? categories;
  num? averageRate;
  bool? inWishlist;
  List<String>? gallery;
  List<ExhibitsEntity>? exhibits;
  List<ProviderTimesEntity>? workingDays;
  ProviderEntity({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.lat,
    this.lng,
    this.about,
    required this.distance,
    this.city,
    this.district,
    this.profileImage,
    this.backgroundImage,
    this.categories,
    this.averageRate,
    this.inWishlist,
    this.gallery,
    this.exhibits,
    this.workingDays,
  });
}
