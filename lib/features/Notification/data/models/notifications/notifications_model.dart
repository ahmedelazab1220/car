import 'data_notification.dart';

class NotificationsModel {
  bool? success;
  int? code;
  dynamic direct;
  String? message;
  List<DataNotifications>? data;

  NotificationsModel({
    this.success,
    this.code,
    this.direct,
    this.message,
    this.data,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        success: json['success'] as bool?,
        code: json['code'] as int?,
        direct: json['direct'] as dynamic,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DataNotifications.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'direct': direct,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
