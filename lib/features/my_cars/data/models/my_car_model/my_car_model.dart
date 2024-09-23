import 'package:car_help/features/lists/data/models/dropdown.model.dart';
import 'package:car_help/features/my_cars/doman/entities/mycars_entity.dart';

import 'car_factory.dart';

class MyCarModel extends MyCarsEntity {
  MyCarModel({
    super.id,
    super.carFactory,
    super.carModel,
    super.manufactureYear,
  });

  factory MyCarModel.fromJson(Map<String, dynamic> json) => MyCarModel(
        id: json['id'] as int?,
        carFactory: json['car_factory'] == null
            ? null
            : CarFactory.fromJson(json['car_factory'] as Map<String, dynamic>),
        carModel: json['car_model'] == null
            ? null
            : DropDownModel.fromJson(json['car_model'] as Map<String, dynamic>),
        manufactureYear: json['manufacture_year'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'car_factory': carFactory,
        'car_model': carModel,
        'manufacture_year': manufactureYear,
      };
}
