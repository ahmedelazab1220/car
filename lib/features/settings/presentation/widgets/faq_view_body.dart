import 'package:car_help/features/settings/domain/entites/faq_entity.dart';
import 'package:car_help/features/settings/presentation/widgets/faq_widget.dart';
import 'package:flutter/material.dart';

class FAQViewBody extends StatelessWidget {
  final List<FaqEntity>? data;
  const FAQViewBody({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return FaqWidget(
            data: data![index],
          );
        });
  }
}
