import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:car_help/features/auth/presentation/widgets/not_subsriber_widget.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
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
            Padding(
              padding: screenPadding(padding: SizeConfig.screenWidth * .04),
              child: AppText(
                text: S.of(context).login,
                align: TextAlign.center,
                fontWeight: FontWeight.bold,
                maxLines: 3,
                textSize: 22,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .04),
            Padding(
              padding: screenPadding(padding: SizeConfig.screenWidth * .04),
              child: AppText(
                text: S.of(context).loginToYourAccount,
                align: TextAlign.center,
                fontWeight: FontWeight.w400,
                maxLines: 3,
                color: Colors.grey,
                textSize: 14,
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .04),
            CustomTextFormField(
              controller: phoneNumber,
              prefixText: "+964  ",
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
            SizedBox(height: SizeConfig.bodyHeight * .04),
            GestureDetector(
              onTap: () => GoRouter.of(context).push(
                AppRouter.kForgetPasswordView,
              ),
              child: AppText(
                text: S.of(context).forgetPassword,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                textSize: 14,
              ),
            ),
            SizedBox(height: SizeConfig.bodyHeight * .08),
            CustomButton(
                color: isValid ? null : AppColors.primary.withOpacity(0.6),
                margin: const EdgeInsets.all(0),
                title: S.of(context).login,
                onPressed: () => formKey.currentState!.validate()
                    ? BlocProvider.of<LoginCubit>(context)
                        .login(phone: phoneNumber.text, password: password.text)
                    : null),
            const Spacer(),
            const NotSubscriberWidget(),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}
