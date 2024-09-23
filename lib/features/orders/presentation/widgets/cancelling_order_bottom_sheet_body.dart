import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancellingOrderBottomSheetBody extends StatefulWidget {
  const CancellingOrderBottomSheetBody({super.key});

  @override
  State<CancellingOrderBottomSheetBody> createState() =>
      _CancellingOrderBottomSheetBodyState();
}

class _CancellingOrderBottomSheetBodyState
    extends State<CancellingOrderBottomSheetBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController reasonForCancellation = TextEditingController();

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
              SvgPicture.asset(AppAssets.warning),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: S.of(context).cacelYourOrder,
                fontWeight: FontWeight.bold,
                textSize: 16,
                color: AppColors.black,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Text(
                textAlign: TextAlign.center,
                S.of(context).worningCancelledOrder,
                style: AppStyles.textStyle12_700Grey,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                maxLines: 4,
                controller: reasonForCancellation,
                labelText: S.of(context).reasonForCancellation,
                hintText: S.of(context).enterReasonForCancellation,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CustomButton(
                  color: AppColors.black,
                  borderColor: AppColors.black,
                  titleColor: Colors.white,
                  title: S.of(context).cancellingOrder,
                  onPressed: () => formKey.currentState!.validate()),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Center(
                      child: AppText(
                    text: S.of(context).skip,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    textSize: 18,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
