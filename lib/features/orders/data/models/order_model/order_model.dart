import 'package:car_help/features/addresses/data/models/address_model.dart';
import 'package:car_help/features/home_client/data/model/provider_model.dart';
import 'package:car_help/features/home_client/data/model/service_model.dart';
import 'package:car_help/features/my_cars/data/models/my_car_model/my_car_model.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    super.id,
    super.orderStatus,
    super.orderType,
    super.userCar,
    super.orderDate,
    super.orderTimeFrom,
    super.orderTimeTo,
    super.userService,
    super.category,
    super.userAddress,
    super.provider,
    super.description,
    super.createdAt,
    super.images,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] as int?,
        orderStatus: json['order_status'] as String?,
        orderType: json['order_type'] as String?,
        userCar: json['user_car'] == null
            ? null
            : MyCarModel.fromJson(json['user_car'] as Map<String, dynamic>),
        orderDate: json['order_date'] as String?,
        orderTimeFrom: json['order_time_from'] as String?,
        orderTimeTo: json['order_time_to'] as String?,
        userService: json['user_service'] == null
            ? null
            : ServiceModel.fromJson(
                json['user_service'] as Map<String, dynamic>),
        category: json['category'] == null
            ? null
            : ServiceModel.fromJson(json['category'] as Map<String, dynamic>),
        userAddress: json['user_address'] == null
            ? null
            : AddressModel.fromJson(
                json['user_address'] as Map<String, dynamic>),
        provider: json['provider'] == null
            ? null
            : ProviderModel.fromJson(json['provider'] as Map<String, dynamic>),
        description: json['description'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        images: json['images'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'order_status': orderStatus,
        'order_type': orderType,
        'user_car': userCar,
        'order_date': orderDate,
        'order_time_from': orderTimeFrom,
        'order_time_to': orderTimeTo,
        'user_service': userService,
        'category': category,
        'user_address': userAddress,
        'provider': provider,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'images': images,
      };
}
