import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/auth/presentation/manager/change%20password%20cubit/change_password_cubit.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  bool isValid = false;
  void _updateIsValid() {
    setState(() {
      isValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        onChanged: _updateIsValid,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomTextFormField(
              controller: oldPassword,
              labelText: S.of(context).oldPassword,
              type: TextInputType.visiblePassword,
              hintText: S.of(context).enterYourPassword,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).oldPasswordValidation : null,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomTextFormField(
              controller: newPassword,
              labelText: S.of(context).newPassword,
              type: TextInputType.visiblePassword,
              hintText: S.of(context).newPasswordLabel,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).newPasswordValidation : null,
              isPassword: true,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomTextFormField(
              controller: confirmNewPassword,
              labelText: S.of(context).confirmNewPassword,
              type: TextInputType.visiblePassword,
              hintText: S.of(context).confirmNewPasswordLabel,
              validate: (value) => value!.isEmpty
                  ? S.of(context).confirmNewPasswordValidation
                  : null,
              isPassword: true,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .08),
            CustomButton(
                color: isValid ? null : AppColors.primary.withOpacity(0.6),
                margin: const EdgeInsets.all(0),
                title: S.of(context).save,
                onPressed: () => formKey.currentState!.validate()
                    ? BlocProvider.of<ChangePasswordCubit>(context)
                        .changePassword(
                        oldPassword: oldPassword.text,
                        newPassword: newPassword.text,
                        passwordConfirmation: confirmNewPassword.text,
                      )
                    : null),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}
