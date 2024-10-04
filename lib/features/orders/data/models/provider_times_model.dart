import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';

class ProviderTimesModel extends ProviderTimesEntity {
  ProviderTimesModel({
    super.date,
    super.day,
    super.from,
    super.to,
    super.isHoliday,
    super.isAvilable,
  });

  factory ProviderTimesModel.fromJson(Map<String, dynamic> json) {
    return ProviderTimesModel(
      date: json['date'] as String?,
      day: json['day'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      isHoliday: json['is_holiday'] as int?,
      isAvilable: json['is_avilable'] as bool?,

    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'day': day,
        'from': from,
        'to': to,
        'is_holiday': isHoliday,
        'is_avilable' : isAvilable,
      };
}
