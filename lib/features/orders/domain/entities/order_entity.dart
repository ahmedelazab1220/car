import 'package:car_help/features/addresses/domain/entities/address_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/my_cars/doman/entities/mycars_entity.dart';

class OrderEntity {
    int? id;
  String? orderStatus;
  String? orderType;
  MyCarsEntity? userCar;
  String? orderDate;
  String? orderTimeFrom;
  String? orderTimeTo;
  ServiceEntity? userService;
  ServiceEntity? category;
  AddressEntity? userAddress;
  ProviderEntity? provider;
  dynamic description;
  DateTime? createdAt;
  List<dynamic>? images;
  OrderEntity({
    this.id,
    this.orderStatus,
    this.orderType,
     this.userCar,
    this.orderDate,
    this.orderTimeFrom,
    this.orderTimeTo,
     this.userService,
     this.category,
     this.userAddress,
    this.provider,
     this.description,
    this.createdAt,
    this.images,
  });
}
