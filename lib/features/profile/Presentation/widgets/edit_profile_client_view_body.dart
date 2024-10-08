import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/profile/Presentation/manager/edit%20cubit/edit_profile_cubit.dart';
import 'package:car_help/features/settings/presentation/settings_helper.dart';
import 'package:car_help/features/settings/presentation/widgets/delete_account_bottom_sheet_body.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileClientViewBody extends StatefulWidget {
  final UserEntity data;
  const EditProfileClientViewBody({super.key, required this.data});

  @override
  State<EditProfileClientViewBody> createState() =>
      _EditProfileClientViewBodyState();
}

class _EditProfileClientViewBodyState extends State<EditProfileClientViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  bool isValid = false, isAgree = false;

  @override
  void initState() {
    super.initState();
    _initVariables();
  }

  Future<void> _initVariables() async {
    name.text = widget.data.name ?? '';
    phoneNumber.text =
        widget.data.phone != null && widget.data.phone!.length >= 4
            ? widget.data.phone!.substring(4, widget.data.phone!.length)
            : '';
  }

  void _updateIsValid() {
    setState(() {
      isValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          onChanged: _updateIsValid,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                type: TextInputType.name,
                controller: name,
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
              SizedBox(height: SizeConfig.bodyHeight * .06),
              CustomButton(
                  margin: const EdgeInsets.all(0),
                  title: S.of(context).save,
                  onPressed: () async {
                    BlocProvider.of<EditProfileCubit>(context).editProfileData(
                      name: name.text.trim(),
                      phone: widget.data.phone,
                    );
                  }),
              SizedBox(
                height: SizeConfig.bodyHeight * 0.02,
              ),
              TextButton(
                onPressed: () => SettingsHelper.showBottomSheetDialog(
                  context: context,
                  widget: const DeleteAccountBottomSheetBody(),
                ),
                child: Text(
                  S.of(context).deleteAccount,
                  style: AppStyles.textStyle16_700Grey.copyWith(
                    color: Colors.red,
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
