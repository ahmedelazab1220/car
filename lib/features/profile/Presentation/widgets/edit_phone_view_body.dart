import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/profile/Presentation/manager/send%20otp%20edit%20phone%20cubit/send_otp_edit_phone_cubit.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPhoneViewBody extends StatefulWidget {
  final List phone;
  const EditPhoneViewBody({super.key, required this.phone});

  @override
  State<EditPhoneViewBody> createState() => _EditPhoneViewBodyState();
}

class _EditPhoneViewBodyState extends State<EditPhoneViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController phoneNumber = TextEditingController();
  String? phone;
  bool isValid = false;

  @override
  void initState() {
    phone = '${widget.phone[0]}${widget.phone[1]}';
    phoneNumber.text = widget.phone[1] ?? '';
    super.initState();
  }

  void _updateIsValid() {
    setState(() {
      isValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        onChanged: _updateIsValid,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.bodyHeight * 0.04,
            ),
            CustomButton(
              color: isValid ? AppColors.primaryYellow : AppColors.grey,
              margin: const EdgeInsets.all(0),
              title: S.of(context).save,
              onPressed: isValid
                  ? () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SendOtpEditPhoneCubit>(context)
                            .sendOtpEditPhone(
                          phone: phone,
                        );
                      }
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
