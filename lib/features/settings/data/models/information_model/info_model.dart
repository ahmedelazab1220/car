import 'data.dart';

class InfoModel {
  bool? success;
  int? code;
  dynamic direct;
  String? message;
  Data? data;

  InfoModel({
    this.success,
    this.code,
    this.direct,
    this.message,
    this.data,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      success: json['success'] as bool?,
      code: json['code'] as int?,
      direct: json['direct'] as dynamic,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'code': code,
        'direct': direct,
        'message': message,
        'data': data?.toJson(),
      };
}
