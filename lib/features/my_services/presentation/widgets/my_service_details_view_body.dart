import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_details_exhibits_card.dart';
import 'package:car_help/features/home_provider/presentation/widgets/client_info_card.dart';
import 'package:car_help/features/my_services/presentation/my_services_helper.dart';
import 'package:car_help/features/orders/presentation/widgets/rating.dart';
import 'package:car_help/features/orders/presentation/widgets/row_widget.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyServiceDetailsViewBody extends StatelessWidget {
  final int requestStatusIndex;

  const MyServiceDetailsViewBody({super.key, required this.requestStatusIndex});

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
                    description: '45672',
                  ),
                  RowWidget(
                    name: S.of(context).orderDate,
                    description: '8 مايو 2024, 3:24 م',
                  ),
                  RowWidget(
                    name: S.of(context).serviceType,
                    description: 'الصيانة المتنقلة',
                  ),
                  RowWidget(
                    name: S.of(context).serviceCost,
                    description: '${S.of(context).currency} 200',
                  ),
                  RowWidget(
                    name: S.of(context).paymentMethod,
                    description: 'ماستر كارت',
                  ),
                  RowWidget(
                    name: S.of(context).attachPhotos,
                    description: 'Carphoto12234455.png',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (requestStatusIndex != 1)
              Text(
                S.of(context).exhibitRequired,
                style: AppStyles.textStyle14_800Black.copyWith(
                  color: AppColors.primary,
                ),
              ),
            const SizedBox(
              height: 6,
            ),
            if (requestStatusIndex != 1)
              const ServiceDetailsExhibitsCard(
                viewPrice: false,
              ),
            const SizedBox(
              height: 16,
            ),
            Text(
              S.of(context).clientInformation,
              style: AppStyles.textStyle14_800Black.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const ClientInfoCard(),
            const SizedBox(
              height: 16,
            ),
            if (requestStatusIndex == 2)
              Text(
                S.of(context).yourEvaluation,
                style: AppStyles.textStyle14_800Black.copyWith(
                  color: AppColors.primary,
                ),
              ),
            const SizedBox(
              height: 6,
            ),
            if (requestStatusIndex == 2)
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
            if (requestStatusIndex == 3)
              Text(
                S.of(context).reasonForCancellation,
                style: AppStyles.textStyle14_800Black.copyWith(
                  color: AppColors.primary,
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            if (requestStatusIndex == 3)
              Container(
                  padding: const EdgeInsets.all(12),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(),
                  ),
                  child: const Text('عدم وجود خدمة كافية تناسبني',
                      style: AppStyles.textStyle16_700)),
            const SizedBox(
              height: 14,
            ),
            if (requestStatusIndex == 1)
              CustomButton(
                title: S.of(context).priceQuote,
                onPressed: () =>
                    MyServicesHelper.showBottomSheetDialog(context: context),
              ),
          ],
        ),
      ),
    );
  }
}
