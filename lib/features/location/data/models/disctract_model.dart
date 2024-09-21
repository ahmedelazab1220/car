import 'package:car_help/features/location/domain/entities/distract_entity.dart';

class DistractModel extends DistractEntity {
  const DistractModel({required super.id, required super.title});

  factory DistractModel.fromJson(Map<String, dynamic> json) =>
      DistractModel(id: json["id"], title: json['title']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
