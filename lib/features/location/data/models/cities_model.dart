import 'package:car_help/features/location/domain/entities/cities_entity.dart';

class CitiesModel extends CitiesEntity {
  const CitiesModel({required super.id, required super.title});

  factory CitiesModel.fromJson(Map<String, dynamic> json) =>
      CitiesModel(id: json["id"], title: json['title']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
