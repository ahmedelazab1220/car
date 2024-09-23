import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_details_exhibits_card.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_card.dart';
import 'package:car_help/features/orders/presentation/widgets/row_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class GeneralOrderDetailsViewBody extends StatelessWidget {
  final int requestStatusIndex;
  const GeneralOrderDetailsViewBody({
    super.key,
    required this.requestStatusIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).orderSummary,
            style: AppStyles.textStyle14_800Black.copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
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
                  name: S.of(context).address,
                  description:
                      'أبراج وقف الملك عبد العزيز - الطابق 11 - أمام بوابة الملك عبد العزيز بالحرم المكي الشريف',
                ),
                RowWidget(
                  name: S.of(context).orderDate,
                  description: '8 مايو 2024, 3:24 م',
                ),
                RowWidget(
                  name: S.of(context).serviceCost,
                  description: '${S.of(context).currency} 200',
                ),
                RowWidget(
                  name: S.of(context).paymentMethod,
                  description: 'ماستر كارت',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            S.of(context).theOfferedService,
            style: AppStyles.textStyle14_800Black.copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const ServiceDetailsExhibitsCard(
            noPrice: false,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            S.of(context).theOfferedService,
            style: AppStyles.textStyle14_800Black.copyWith(
              color: AppColors.primary,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          // const ServiceProvidersCard(data: null,)
        ],
      ),
    );
  }
}
