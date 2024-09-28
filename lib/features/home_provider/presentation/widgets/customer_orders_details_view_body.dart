import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_provider/presentation/widgets/client_info_card.dart';
import 'package:car_help/features/home_provider/presentation/widgets/order_summary_card.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomerOrdersDetailsViewBody extends StatelessWidget {
  const CustomerOrdersDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
              height: 10,
            ),
            const OrderSummaryCard(),
            const SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).clientInformation,
              style: AppStyles.textStyle14_800Black.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const ClientInfoCard(),
            const SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).priceOffer,
              style: AppStyles.textStyle14_800Black.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}
