import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';

class OrderEntity {
    int? id;
  String? orderStatus;
  String? orderType;
  dynamic userCarId;
  String? orderDate;
  String? orderTimeFrom;
  String? orderTimeTo;
  dynamic userServiceId;
  dynamic categoryId;
  dynamic userAddressId;
  ProviderEntity? provider;
  dynamic description;
  DateTime? createdAt;
  List<dynamic>? images;
  OrderEntity({
    this.id,
    this.orderStatus,
    this.orderType,
    required this.userCarId,
    this.orderDate,
    this.orderTimeFrom,
    this.orderTimeTo,
    required this.userServiceId,
    required this.categoryId,
    required this.userAddressId,
    this.provider,
    required this.description,
    this.createdAt,
    this.images,
  });
}
