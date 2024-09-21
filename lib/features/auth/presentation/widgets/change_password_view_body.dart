import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/not_subsriber_widget.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
              labelText: S.of(context).password,
              type: TextInputType.visiblePassword,
              hintText: S.of(context).enterYourPassword,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).passwordValidation : null,
              isPassword: true,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomTextFormField(
              controller: oldPassword,
              labelText: S.of(context).password,
              type: TextInputType.visiblePassword,
              hintText: S.of(context).enterYourPassword,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).passwordValidation : null,
              isPassword: true,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomTextFormField(
              controller: oldPassword,
              labelText: S.of(context).password,
              type: TextInputType.visiblePassword,
              hintText: S.of(context).enterYourPassword,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).passwordValidation : null,
              isPassword: true,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .08),
            CustomButton(
                color: isValid ? null : AppColors.primary.withOpacity(0.6),
                margin: const EdgeInsets.all(0),
                title: S.of(context).login,
                onPressed: () => formKey.currentState!.validate()
                // ? BlocProvider.of<LoginCubit>(context)
                //     .login(phone: phoneNumber.text, password: password.text)
                // : null),
                ),
            const Spacer(),
            const NotSubscriberWidget(),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}
