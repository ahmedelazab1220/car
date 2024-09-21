import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class TermsRegisterWidget extends StatefulWidget {
  final void Function(bool) isTrue;

  const TermsRegisterWidget({
    super.key,
    required this.isTrue,
  });

  @override
  State<TermsRegisterWidget> createState() => _TermsRegisterWidgetState();
}

class _TermsRegisterWidgetState extends State<TermsRegisterWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CupertinoCheckbox(
              activeColor: AppColors.black,
              focusColor: AppColors.black,
              checkColor: AppColors.white,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                  widget.isTrue(isChecked);
                });
              }),
          const SizedBox(
            width: 2,
          ),
          Text(
            S.of(context).registerCheckBox1,
            style: AppStyles.textStyle12_500,
          ),
          const SizedBox(
            width: 4,
          ),
          GestureDetector(
            onTap: () =>
                GoRouter.of(context).push(AppRouter.kTermsAndConditions),
            child: Text(
              S.of(context).termsAndConditions,
              style: AppStyles.textStyle12_700.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
