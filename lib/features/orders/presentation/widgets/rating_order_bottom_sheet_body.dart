import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/orders/presentation/widgets/rating.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingOrderBottomSheetBody extends StatefulWidget {
  const RatingOrderBottomSheetBody({super.key});

  @override
  State<RatingOrderBottomSheetBody> createState() =>
      _RatingOrderBottomSheetBodyState();
}

class _RatingOrderBottomSheetBodyState
    extends State<RatingOrderBottomSheetBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController carBrand = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Container(
                width: SizeConfig.screenWidth * .2,
                height: 5,
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              SvgPicture.asset(AppAssets.doneRingRound),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: S.of(context).successfullyReceived,
                fontWeight: FontWeight.bold,
                textSize: 16,
                color: AppColors.black,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Text(
                textAlign: TextAlign.center,
                S.of(context).rateToHelp,
                style: AppStyles.textStyle12_700Grey,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              RatingWidget(
                initialRating: 1,
                onRatingUpdate: (value) {},
                text: S.of(context).responsiveness,
              ),
              RatingWidget(
                initialRating: 1,
                onRatingUpdate: (value) {},
                text: S.of(context).workmanship,
              ),
              RatingWidget(
                initialRating: 1,
                onRatingUpdate: (value) {},
                text: S.of(context).priceForService,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomButton(
                color: AppColors.black,
                borderColor: AppColors.black,
                titleColor: AppColors.white,
                title: S.of(context).send,
                onPressed: () => formKey.currentState!.validate(),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
            ],
          ),
        ),
      ),
    );
  }
}
