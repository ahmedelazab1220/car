import 'package:car_help/features/addresses/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    super.id,
    super.ownerName,
    super.ownerPhone,
    super.address,
    super.lat,
    super.lng,
    super.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json['id'] as int?,
        ownerName: json['owner_name'] as String?,
        ownerPhone: json['owner_phone'] as String?,
        address: json['address'] as String?,
        lat: json['lat'] as String?,
        lng: json['lng'] as String?,
        isDefault: json['is_default'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'owner_name': ownerName,
        'owner_phone': ownerPhone,
        'address': address,
        'lat': lat,
        'lng': lng,
        'is_default': isDefault,
      };
}
