import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/presentation/manager/register%20cubit/register_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/address_register_widget.dart';
import 'package:car_help/features/auth/presentation/widgets/terms_register_widget.dart';
import 'package:car_help/features/lists/presentation/controllers/multi_select_classification_controller.dart';
import 'package:car_help/features/lists/presentation/manager/districts%20cubit/districts_cubit.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterProviderViewBody extends StatefulWidget {
  const RegisterProviderViewBody({
    super.key,
  });

  @override
  State<RegisterProviderViewBody> createState() =>
      _RegisterProviderViewBodyState();
}

class _RegisterProviderViewBodyState extends State<RegisterProviderViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController companyName = TextEditingController();
  TextEditingController commercialRegistrationNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController addressController = TextEditingController();

  int? city, district;
  double? lat, lng;
  List<int> categoryIds = [];
  bool isAgree = false;
  bool isValid = false;
  void _updateIsValid() {
    setState(() {
      isValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Form(
        key: formKey,
        onChanged: _updateIsValid,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            controller: companyName,
            labelText: S.of(context).centerName,
            hintText: S.of(context).enterCenterName,
            validate: (value) =>
                value!.isEmpty ? S.of(context).feildRequiredValidation : null,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            controller: commercialRegistrationNumber,
            type: TextInputType.number,
            labelText: S.of(context).commercialRegister,
            hintText: S.of(context).enterCommercialRegister,
            validate: (value) =>
                value!.isEmpty ? S.of(context).feildRequiredValidation : null,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          MultiSelectClassificationController(
            onSelectedIds: (selectedIds) {
              setState(() {
                categoryIds = selectedIds;
              });
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          AddressRegisterWidget(
            onSelectedCityId: (selectedId) {
              setState(() {
                city = selectedId;
              });
              BlocProvider.of<DistrictsCubit>(context)
                  .getDistricts(id: selectedId);
            },
            onSelectedDistrictId: (selectedId) {
              setState(() {
                district = selectedId;
              });
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
              controller: addressController,
              labelText: S.of(context).additionalAddressDetails,
              hintText: S.of(context).enterCommercialRegister,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).feildRequiredValidation : null,
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.kPickLocationScreen)
                    .then((value) {
                  if (value != null) {
                    LocationEntity locationEntity = value as LocationEntity;
                    String address = locationEntity.address ?? "";
                    addressController.text = address;
                    lat = locationEntity.latitude;
                    lng = locationEntity.longitude;
                  }
                });
              }),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            controller: phoneNumber,
            prefixText: "+966  ",
            labelText: S.of(context).phoneNumber,
            hintText: S.of(context).enterYourPhoneNumber,
            type: TextInputType.phone,
            validate: (value) =>
                value!.isEmpty ? S.of(context).phoneNumberValidation : null,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            controller: password,
            labelText: S.of(context).password,
            type: TextInputType.visiblePassword,
            hintText: S.of(context).enterYourPassword,
            validate: (value) =>
                value!.isEmpty ? S.of(context).passwordValidation : null,
            isPassword: true,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
            controller: confirmPassword,
            labelText: S.of(context).confirmPassword,
            type: TextInputType.visiblePassword,
            hintText: S.of(context).confirmNewPasswordLabel,
            validate: (value) => value!.isEmpty
                ? S.of(context).confirmNewPasswordValidation
                : null,
            isPassword: true,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          TermsRegisterWidget(
            isTrue: (value) {
              setState(() {
                isAgree = value;
              });
            },
          ),
          CustomButton(
              color: isValid && isAgree
                  ? null
                  : AppColors.primary.withOpacity(0.6),
              margin: const EdgeInsets.all(0),
              title: S.of(context).createAccount,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<RegisterCubit>(context).register(
                    userType: AppStrings.provider,
                    name: companyName.text.trim(),
                    phone: phoneNumber.text.trim(),
                    address: addressController.text.trim(),
                    password: password.text.trim(),
                    passwordConfirmation: confirmPassword.text.trim(),
                    cityId: city,
                    districtId: district,
                    lat: lat,
                    lng: lng,
                    commercialRegister:
                        commercialRegistrationNumber.text.trim(),
                    categoryIds: categoryIds,
                  );
                }
              }),
        ]),
      ),
    ));
  }
}
