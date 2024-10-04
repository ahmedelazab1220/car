import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_card.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/widgets/rating.dart';
import 'package:car_help/features/orders/presentation/widgets/row_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExhibitOrderDetailsViewBody extends StatelessWidget {
  final String? orderStatuse;
  final OrderEntity? data;
  const ExhibitOrderDetailsViewBody({
    super.key,
    required this.orderStatuse,
    required this.data,
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
                    description: data?.id.toString() ?? '',
                  ),
                  RowWidget(
                    name: S.of(context).address,
                    description: data?.provider?.address ?? '',
                  ),
                  RowWidget(
                    name: S.of(context).orderDate,
                    description: formatTimestamp(
                        data?.createdAt ?? DateTime.now(), context),
                  ),
                  RowWidget(
                    name: S.of(context).serviceCost,
                    description: '200 ${S.of(context).currency}',
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
              height: 6,
            ),
            // const ServiceDetailsExhibitsCard(
            //   viewPrice: false,
            // ),
            const SizedBox(
              height: 16,
            ),
            Text(
              S.of(context).theOfferedService,
              style: AppStyles.textStyle14_800Black.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            ServiceProvidersCard(
              onTap: () => GoRouter.of(context).push(
                AppRouter.kProviderDetailsView,
                extra: data,
              ),
              data: data!.provider!,
            ),
            const SizedBox(
              height: 14,
            ),
            if (orderStatuse == AppStrings.completed)
              Text(
                S.of(context).yourEvaluation,
                style: AppStyles.textStyle14_800Black.copyWith(
                  color: AppColors.primary,
                ),
              ),
            const SizedBox(
              height: 6,
            ),
            if (orderStatuse == AppStrings.completed)
              Container(
                padding: const EdgeInsets.all(4),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(),
                ),
                child: const Rate(
                  initialRating: 3.5,
                ),
              ),
            if (orderStatuse == AppStrings.canceled)
              Text(
                S.of(context).reasonForCancellation,
                style: AppStyles.textStyle14_800Black.copyWith(
                  color: AppColors.primary,
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            if (orderStatuse == AppStrings.canceled)
              Container(
                  padding: const EdgeInsets.all(12),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(),
                  ),
                  child: const Text('عدم وجود خدمة كافية تناسبني',
                      style: AppStyles.textStyle16_800)),
            const SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
