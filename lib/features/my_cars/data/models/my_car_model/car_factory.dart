import 'package:car_help/features/my_cars/doman/entities/car_factory_entity.dart';

class CarFactory extends CarFactoryEntity {
  CarFactory({super.id, super.title, super.logo});

  factory CarFactory.fromJson(Map<String, dynamic> json) => CarFactory(
        id: json['id'] as int?,
        title: json['title'] as String?,
        logo: json['logo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'logo': logo,
      };
}
