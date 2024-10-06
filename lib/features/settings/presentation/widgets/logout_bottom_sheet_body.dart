import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoutBottomSheetBody extends StatefulWidget {
  final void Function()? onTap;
  const LogoutBottomSheetBody({super.key, this.onTap});

  @override
  State<LogoutBottomSheetBody> createState() => _LogoutBottomSheetBodyState();
}

class _LogoutBottomSheetBodyState extends State<LogoutBottomSheetBody> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Container(
                width: SizeConfig.screenWidth * .2,
                height: 5,
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              SvgPicture.asset(AppAssets.warning),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: S.of(context).logoutMsg,
                fontWeight: FontWeight.bold,
                textSize: 16,
                color: AppColors.black,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CustomButton(
                borderColor: AppColors.black,
                titleColor: AppColors.white,
                color: AppColors.black,
                title: S.of(context).logout,
                onPressed: () {
                  widget.onTap!();
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Center(
                      child: AppText(
                    text: S.of(context).skip,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                    textSize: 18,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
