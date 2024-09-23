import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/auth/presentation/manager/send%20otp%20cubit/send_otp_cubit.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneNumber = TextEditingController();
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
                text: S.of(context).forgetPassword,
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
                text: S.of(context).forgetPasswordBody1,
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
              prefixText: "+966  ",
              labelText: S.of(context).phoneNumber,
              hintText: S.of(context).enterYourPhoneNumber,
              type: TextInputType.phone,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).phoneNumberValidation : null,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .08),
            CustomButton(
                margin: const EdgeInsets.all(0),
                title: S.of(context).send,
                onPressed: () => formKey.currentState!.validate()
                    ? BlocProvider.of<SendOtpCubit>(context).sendOtpCode(
                        phone: phoneNumber.text,
                      )
                    : null),
          ],
        ),
      ),
    );
  }
}
