import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';

class DropDownModel extends DropDownEntity {
  DropDownModel({super.id, super.title});

  factory DropDownModel.fromJson(Map<String, dynamic> json) => DropDownModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
