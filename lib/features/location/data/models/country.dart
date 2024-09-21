import 'package:car_help/features/location/domain/entities/country_entity.dart';

class Country extends CountryEntity {
  const Country({required super.id, required super.title});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json['id'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
