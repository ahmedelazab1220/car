import 'package:car_help/features/orders/presentation/widgets/row_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          RowWidget(
            name: S.of(context).orderNumber,
            description: '45672',
          ),
          RowWidget(
            name: S.of(context).orderDate,
            description: '8 مايو 2024, 3:24 م',
          ),
          RowWidget(
            name: S.of(context).carModel,
            description: '2024',
          ),
          RowWidget(
            name: S.of(context).carType,
            description: 'مرسيدس بنز 2019',
          ),
          RowWidget(
            name: S.of(context).carBrand,
            description: 'ماي باخ',
          ),
          RowWidget(
            name: S.of(context).serviceType,
            description: 'الصيانة المتنقلة',
          ),
          RowWidget(
            name: S.of(context).orderDetails,
            description:
                'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. ',
          ),
        ],
      ),
    );
  }
}
