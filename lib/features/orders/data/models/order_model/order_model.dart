import 'package:car_help/features/home_client/data/model/provider_model.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity{


  OrderModel({
    super.id,
    super.orderStatus,
    super.orderType,
    super.userCarId,
    super.orderDate,
    super.orderTimeFrom,
    super.orderTimeTo,
    super.userServiceId,
    super.categoryId,
    super.userAddressId,
    super.provider,
    super.description,
    super.createdAt,
    super.images,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] as int?,
        orderStatus: json['order_status'] as String?,
        orderType: json['order_type'] as String?,
        userCarId: json['user_car_id'] as dynamic,
        orderDate: json['order_date'] as String?,
        orderTimeFrom: json['order_time_from'] as String?,
        orderTimeTo: json['order_time_to'] as String?,
        userServiceId: json['user_service_id'] as dynamic,
        categoryId: json['category_id'] as dynamic,
        userAddressId: json['user_address_id'] as dynamic,
        provider: json['provider_id'] == null
            ? null
            : ProviderModel.fromJson(json['provider_id'] as Map<String, dynamic>),
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
        'user_car_id': userCarId,
        'order_date': orderDate,
        'order_time_from': orderTimeFrom,
        'order_time_to': orderTimeTo,
        'user_service_id': userServiceId,
        'category_id': categoryId,
        'user_address_id': userAddressId,
        'provider_id': provider,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'images': images,
      };
}
