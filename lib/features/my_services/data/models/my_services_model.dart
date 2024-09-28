import 'package:car_help/features/my_services/domain/entities/my_services_entity.dart';

class MyServicesModel extends MyServicesEntity {
  MyServicesModel({
    super.id,
    super.title,
    super.price,
    super.priceAfterDiscount,
    super.qty,
    super.description,
    super.images,
  });

  factory MyServicesModel.fromJson(Map<String, dynamic> json) {
    return MyServicesModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      priceAfterDiscount: json['price_after_discount'] as num?,
      qty: json['qty'] as int?,
      description: json['description'] as String?,
      images: json['images'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'price_after_discount': priceAfterDiscount,
        'qty': qty,
        'description': description,
        'images': images,
      };
}
