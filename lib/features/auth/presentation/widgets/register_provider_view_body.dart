import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/auth/presentation/manager/register%20cubit/register_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/address_register_widget.dart';
import 'package:car_help/features/auth/presentation/widgets/terms_register_widget.dart';
import 'package:car_help/features/lists/presentation/controllers/center_classification_controller.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field%20copy.dart';
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
  TextEditingController additionalAddress = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  int? city, district;

  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Form(
        key: formKey,
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
            labelText: S.of(context).commercialRegister,
            hintText: S.of(context).enterCommercialRegister,
            validate: (value) =>
                value!.isEmpty ? S.of(context).feildRequiredValidation : null,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CenterClassificationController(
            onSelectedIds: (selectedIds) {},
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          /*
            CustomTextFormField(
              controller: companyName,
              labelText: setTranslate(
                context: context,
                key: 'companyName',
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomTextFormField(
              controller: commercialRegistrationNumber,
              type: TextInputType.number,
              labelText: setTranslate(
                context: context,
                key: 'commercialRegistrationNumber',
              ),
            ),*/
          // CustomTextFormField(
          //   readOnly: true,
          //   suffixIcon: AppAssets.arrowDown,
          //   padding: EdgeInsets.only(
          //       top: SizeConfig.bodyHeight * .025,
          //       bottom: SizeConfig.bodyHeight * .025,
          //       right: SizeConfig.bodyHeight * .025),
          //   onTap: () => AuthHelper().showServiceDialogSheet(context: context),
          //   controller: TextEditingController(
          //       text: cubit.selectedCategoriesTitles.isEmpty
          //           ? ""
          //           : AuthHelper.convertStringList(
          //                   context: context,
          //                   orList: cubit.selectedCategoriesTitles)
          //               .join(" , ")),
          //   labelText: context.localizations.centerClassification,
          // ),
          AddressRegisterWidget(
            onSelectedCityId: (selectedId) {
              setState(() {
                city = selectedId;
              });
            },
            onSelectedDistrictId: (selectedId) {
              setState(() {
                district = selectedId;
              });
            },
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          CustomTextFormField(
              controller: commercialRegistrationNumber,
              labelText: S.of(context).additionalAddressDetails,
              hintText: S.of(context).enterCommercialRegister,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).feildRequiredValidation : null,
              onTap: () {
                GoRouter.of(context).push(AppRouter.kPickLocationScreen);
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
            suffixIcon: AppAssets.eyes,
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
            suffixIcon: AppAssets.eyes,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          TermsRegisterWidget(
            isTrue: (value) {},
          ),
          CustomButton(
            color: isAgree ? null : AppColors.primary.withOpacity(0.6),
            margin: const EdgeInsets.all(0),
            title: S.of(context).createAccount,
            onPressed: isAgree
                ? () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<RegisterCubit>(context).register(
                          // name: name.text.trim(),
                          // phone: phoneNumber,
                          // carCode: carCode.text.trim(),
                          // carNumber: int.parse(carNumber.text),
                          // address: address.text.trim(),
                          );
                    }
                  }
                : null,
          ),
        ]),
      ),
    ));
  }
}
