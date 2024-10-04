import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class BookingPriceCard extends StatelessWidget {
  const BookingPriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.hint),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(S.of(context).serviceCost, style: AppStyles.textStyle12_700),
              const Spacer(),
              Text(
                '300 ${S.of(context).currency}',
                style: AppStyles.textStyle12_500,
              ),
            ],
          ),
          Row(
            children: [
              Text(S.of(context).tax, style: AppStyles.textStyle12_700),
              const Spacer(),
              const Text(
                '10 %',
                style: AppStyles.textStyle12_500,
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Text(S.of(context).total, style: AppStyles.textStyle12_700),
              const Spacer(),
              Text(
                '330 ${S.of(context).currency}',
                style: AppStyles.textStyle12_500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
