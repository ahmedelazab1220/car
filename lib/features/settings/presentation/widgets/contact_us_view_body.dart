import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/lists/presentation/controllers/problem_types_controller.dart';
import 'package:car_help/features/settings/presentation/manager/contact%20cubit/contact_us_cubit.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsViewBody extends StatefulWidget {
  const ContactUsViewBody({super.key});

  @override
  State<ContactUsViewBody> createState() => _ContactUsViewBodyState();
}

class _ContactUsViewBodyState extends State<ContactUsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController address = TextEditingController();
  bool isValid = false;
  int? problemId;

  void _updateIsValid() {
    setState(() {
      isValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                onChanged: _updateIsValid,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        height: SizeConfig.screenWidth * 0.25,
                        child: Image.asset(AppAssets.appLogo)),
                    SizedBox(
                      height: SizeConfig.bodyHeight * 0.04,
                    ),
                    CustomTextFormField(
                      controller: name,
                      labelText: S.of(context).fullName,
                      hintText: S.of(context).fullNameHint,
                      validate: (value) => value!.isEmpty
                          ? S.of(context).fullNameValidation
                          : null,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                    CustomTextFormField(
                      controller: phoneNumber,
                      prefixText: "+966  ",
                      labelText: S.of(context).phoneNumber,
                      hintText: S.of(context).enterYourPhoneNumber,
                      type: TextInputType.phone,
                      validate: (value) => value!.isEmpty
                          ? S.of(context).phoneNumberValidation
                          : null,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                    CustomTextFormField(
                      controller: email,
                      labelText: S.of(context).email,
                      hintText: S.of(context).email,
                      validate: (value) =>
                          value!.isEmpty ? S.of(context).emailValidation : null,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                    ProblemTypesController(
                      onSelectedId: (value) {
                        setState(() {
                          problemId = value;
                        });
                      },
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                    CustomTextFormField(
                      maxLines: 5,
                      controller: message,
                      labelText: S.of(context).yourMessage,
                      hintText: S.of(context).yourMessageHint,
                      validate: (value) => value!.isEmpty
                          ? S.of(context).yourMessageValidation
                          : null,
                    ),
                    SizedBox(
                      height: SizeConfig.bodyHeight * .04,
                    ),
                    CustomButton(
                      color:
                          isValid ? null : AppColors.primary.withOpacity(0.6),
                      margin: const EdgeInsets.all(0),
                      title: S.of(context).send,
                      onPressed: isValid
                          ? () {
                              BlocProvider.of<ContactUsCubit>(context)
                                  .posrContactUs(
                                name: name.text,
                                phone: phoneNumber.text,
                                email: email.text,
                                message: message.text,
                                problemId: problemId,
                              );
                            }
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
