import 'package:car_help/features/home_provider/domain/entities/home_provider_entity.dart';

class HomeProviderModel extends HomeProviderEntity {
  HomeProviderModel({
    super.exhibts,
    super.pending,
    super.inProgress,
    super.completed,
    super.canceled,
  });

  factory HomeProviderModel.fromJson(Map<String, dynamic> json) {
    return HomeProviderModel(
      exhibts: json['0'] as List<dynamic>?,
      pending: json['pending'] as int?,
      inProgress: json['in-progress'] as int?,
      completed: json['completed'] as int?,
      canceled: json['canceled'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '0': exhibts,
        'pending': pending,
        'in-progress': inProgress,
        'completed': completed,
        'canceled': canceled,
      };
}
