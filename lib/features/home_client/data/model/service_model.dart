import 'package:car_help/features/home_client/domain/entities/service_entity.dart';

class ServiceModel extends ServiceEntity {
  ServiceModel({super.id, super.name, super.icon});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json['id'] as int?,
        name: json['title'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': name,
        'icon': icon,
      };
}
