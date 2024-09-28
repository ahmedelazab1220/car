import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PriceQuoteBottomSheetBody extends StatefulWidget {
  const PriceQuoteBottomSheetBody({super.key});

  @override
  State<PriceQuoteBottomSheetBody> createState() =>
      _PriceQuoteBottomSheetBodyState();
}

class _PriceQuoteBottomSheetBodyState extends State<PriceQuoteBottomSheetBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController carBrand = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              AppText(
                text: S.of(context).priceQuote,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                textSize: 18,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CustomTextFormField(
                type: TextInputType.number,
                controller: carBrand,
                labelText: S.of(context).price,
                hintText: S.of(context).enterPrice,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomButton(
                  color: AppColors.black,
                  borderColor: AppColors.black,
                  titleColor: Colors.white,
                  title: S.of(context).sendTheOffer,
                  onPressed: () => formKey.currentState!.validate()),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Center(
                  child: AppText(
                    text: S.of(context).cancel,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    textSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
