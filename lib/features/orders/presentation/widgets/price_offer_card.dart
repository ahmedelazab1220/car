import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/orders/presentation/orders_helper.dart';
import 'package:car_help/features/orders/presentation/widgets/row_widget.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class PriceOfferCard extends StatelessWidget {
  const PriceOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            '300 ${S.of(context).currency}',
            style: AppStyles.textStyle18_900,
          ),
          Divider(
            color: AppColors.black,
          ),
          RowWidget(
            name: S.of(context).comments,
            description:
                'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. ',
          ),
          RowWidget(
            name: S.of(context).attachPhotos,
            description: 'Carphoto12234455.png',
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 140,
                child: CustomButton(
                  height: 50,
                  title: S.of(context).accept,
                  onPressed: () => OrdersHelper.showBottomSheetDialog(
                      context: context, orderStatuse: ''),
                ),
              ),
              SizedBox(
                width: 140,
                child: CustomButton(
                  height: 50,
                  color: AppColors.black,
                  borderColor: AppColors.black,
                  titleColor: AppColors.white,
                  title: S.of(context).reject,
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
