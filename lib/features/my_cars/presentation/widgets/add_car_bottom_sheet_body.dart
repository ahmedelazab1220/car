import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/lists/presentation/controllers/car_factories_controller.dart';
import 'package:car_help/features/lists/presentation/controllers/car_models_controller.dart';
import 'package:car_help/features/my_cars/presentation/manager/mycars%20cubit/my_cars_cubit.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCarBottomSheetBody extends StatefulWidget {
  const AddCarBottomSheetBody({super.key});

  @override
  State<AddCarBottomSheetBody> createState() => _AddCarBottomSheetBodyState();
}

class _AddCarBottomSheetBodyState extends State<AddCarBottomSheetBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController carType = TextEditingController();
  int? caeBrandId, carModelId;
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
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CarFactoriesController(
                onSelectedId: (value) {
                  caeBrandId = value;
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CarModelsController(
                onSelectedId: (value) {
                  carModelId = value;
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),

              CustomTextFormField(
                controller: carType,
                labelText: S.of(context).carType,
                hintText: S.of(context).enterTypeCar,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CustomButton(
                margin: EdgeInsets.zero,
                color: AppColors.black,
                borderColor: AppColors.black,
                titleColor: Colors.white,
                title: S.of(context).addACar,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<MyCarsCubit>(context).addMyCar(
                      carFactoryId: caeBrandId,
                      carModelId: caeBrandId,
                      manufactureYear: carType.text,
                    );
                  }
                },
              ),
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
