import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field%20copy.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';
import '../../../../core/utils/app_assets.dart';

class MakeRequestWidget extends StatelessWidget {
  const MakeRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController carBrand = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              // CustomDropDown(
              //   labelText: context.localizations.carBrand,
              //   hintText: context.localizations.chooseBrandCar,
              //   // validate: (value) => value!.isEmpty
              //   //     ? context.localizations.feildRequiredValidation
              //   //     : null,
              //   suffixIcon: AppAssets.arrowDown,
              //   padding: EdgeInsets.all(
              //     SizeConfig.bodyHeight * .025,
              //   ),
              //   categories: const [
              //     'BMW',
              //     'Mercedes',
              //     'Audi',
              //     'Volkswagen',
              //     'Toyota'
              //   ],
              //   onSelected: (value) {},
              // ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                controller: carBrand,
                labelText: S.of(context).carModel,
                hintText: S.of(context).enterModelCar,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                controller: carBrand,
                labelText: S.of(context).carType,
                hintText: S.of(context).enterTypeCar,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CustomButton(
                  color: AppColors.black,
                  borderColor: AppColors.black,
                  titleColor: Colors.white,
                  title: S.of(context).addACar,
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
