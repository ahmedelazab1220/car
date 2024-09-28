import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/home_provider/presentation/home_provider_helper.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_picker_image.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';

class PriceSubmissionWidget extends StatelessWidget {
  const PriceSubmissionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController reasonForCancellation = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.bodyHeight * .04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth * .43,
                child: CustomTextFormField(
                  type: TextInputType.number,
                  controller: reasonForCancellation,
                  labelText: S.of(context).from,
                  hintText: S.of(context).enterPrice,
                  validate: (value) => value!.isEmpty
                      ? S.of(context).feildRequiredValidation
                      : null,
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * .43,
                child: CustomTextFormField(
                  type: TextInputType.number,
                  controller: reasonForCancellation,
                  labelText: S.of(context).to,
                  hintText: S.of(context).enterPrice,
                  validate: (value) => value!.isEmpty
                      ? S.of(context).feildRequiredValidation
                      : null,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .04),
          CustomTextFormField(
            maxLines: 4,
            controller: reasonForCancellation,
            labelText: S.of(context).comments,
            hintText: S.of(context).enterComments,
            validate: (value) =>
                value!.isEmpty ? S.of(context).feildRequiredValidation : null,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .03),
          CustomPickerImages(
            onImageSelected: (file, name) {},
          ),
          SizedBox(height: SizeConfig.bodyHeight * .06),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                width: SizeConfig.screenWidth * .43,
                color: AppColors.primary,
                borderColor: AppColors.primary,
                titleColor: AppColors.black,
                title: S.of(context).sendTheOffer,
                onPressed: () => HomeProviderHelper.showBottomSheetDialog(
                  context: context,
                ),
              ),
              CustomButton(
                  width: SizeConfig.screenWidth * .43,
                  color: AppColors.black,
                  borderColor: AppColors.black,
                  titleColor: AppColors.white,
                  title: S.of(context).rejectTheRequest,
                  onPressed: () {}
                  //  OrdersHelper.showBottomSheetDialog(
                  //   context: context,
                  //   requestStatusIndex: requestStatusIndex,
                  // ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
