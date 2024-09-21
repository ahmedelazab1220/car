import 'package:car_help/features/settings/domain/entites/faq_entity.dart';

class FaqModel extends FaqEntity {
  FaqModel({super.id, super.title, super.answer});

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        answer: json['answer'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'answer': answer,
      };
}
