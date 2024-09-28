import 'package:car_help/features/orders/presentation/widgets/row_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class ClientInfoCard extends StatelessWidget {
  const ClientInfoCard({
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
            name: S.of(context).clientName,
            description: 'محمد احمد',
          ),
          RowWidget(
            name: S.of(context).clientAddress,
            description:
                'أبراج وقف الملك عبد العزيز - الطابق 11 - أمام بوابة الملك عبد العزيز بالحرم المكي الشريف',
          ),
        ],
      ),
    );
  }
}
