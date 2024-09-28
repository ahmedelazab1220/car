import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';

class ExhibitsModel extends ExhibitsEntity {
  ExhibitsModel({
    super.id,
    super.title,
    super.price,
    super.priceAfterDiscount,
    super.qty,
    super.description,
    super.images,
  });

  factory ExhibitsModel.fromJson(Map<String, dynamic> json) {
    return ExhibitsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'] as int?,
      priceAfterDiscount: json['price_after_discount'] as num?,
      qty: json['qty'] as int?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
