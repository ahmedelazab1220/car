import 'dart:io';

import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/presentation/manager/register%20cubit/register_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/terms_register_widget.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterClientViewBody extends StatefulWidget {
  const RegisterClientViewBody({
    super.key,
  });

  @override
  State<RegisterClientViewBody> createState() => _RegisterClientViewBodyState();
}

class _RegisterClientViewBodyState extends State<RegisterClientViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isValid = false, isAgree = false;
  File? profileImage;

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
            controller: fullName,
            labelText: S.of(context).fullName,
            hintText: S.of(context).fullNameHint,
            validate: (value) =>
                value!.isEmpty ? S.of(context).fullNameValidation : null,
          ),
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
          TermsRegisterWidget(
            isTrue: (value) {
              setState(() {
                isAgree = value;
              });
            },
          ),
          CustomButton(
            color:
                isValid && isAgree ? null : AppColors.primary.withOpacity(0.6),
            margin: const EdgeInsets.all(0),
            title: S.of(context).createAccount,
            onPressed: isValid && isAgree
                ? () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<RegisterCubit>(context).register(
                        userType: AppStrings.client,
                        name: fullName.text.trim(),
                        phone: phoneNumber.text.trim(),
                        password: password.text.trim(),
                        passwordConfirmation: confirmPassword.text,
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
