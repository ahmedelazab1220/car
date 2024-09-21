import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneFormField extends StatelessWidget {
  const CustomPhoneFormField({
    super.key,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
  });
  final Function(PhoneNumber?)? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final bool readOnly;
  final Widget? suffixIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: IntlPhoneField(
        onTap: onTap,
        languageCode: AppStrings.englishCode,
        enabled: !readOnly,
        initialValue: initialValue,
        initialCountryCode: initialValue == null ? 'IQ' : null,
        dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: const Icon(
          Icons.expand_more,
        ),
        invalidNumberMessage: S.of(context).phoneValidation,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return S.of(context).phoneVerification;
          }
          return null;
        },
        decoration: InputDecoration(
          isDense: true,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          suffixIcon: suffixIcon,
          hintText: '555555555',
          hintStyle: TextStyle(color: AppColors.grey),
          // hintStyle: TextStyle(color: Colors.blue),
          // filled: true,
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
