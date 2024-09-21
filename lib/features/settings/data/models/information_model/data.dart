import 'package:car_help/features/settings/domain/entites/info_entity.dart';

class Data extends InfoEntity {
  int? id;
  String? title;
  String? description;

  Data({this.id, this.title, this.description})
      : super(
          idE: id,
          titleE: title,
          descriptionE: description,
        );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'tiltle': title,
        'description': description,
      };
}
