import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendOfferBottomSheetBody extends StatefulWidget {
  const SendOfferBottomSheetBody({super.key});

  @override
  State<SendOfferBottomSheetBody> createState() =>
      _SendOfferBottomSheetBodyState();
}

class _SendOfferBottomSheetBodyState extends State<SendOfferBottomSheetBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController carBrand = TextEditingController();

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
              SvgPicture.asset(AppAssets.doneRingRound),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: S.of(context).sentSuccessfully,
                fontWeight: FontWeight.bold,
                textSize: 16,
                color: AppColors.black,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Text(
                textAlign: TextAlign.center,
                S.of(context).receiveANotification,
                style: AppStyles.textStyle12_700Grey,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomButton(
                  color: AppColors.black,
                  borderColor: AppColors.black,
                  titleColor: Colors.white,
                  title: S.of(context).backToHomePage,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
              SizedBox(height: SizeConfig.bodyHeight * .02),
            ],
          ),
        ),
      ),
    );
  }
}
