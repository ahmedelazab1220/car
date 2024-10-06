import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MakeAnOrderBottomSheetBody extends StatefulWidget {
  final String? subTitle;
  final String? title;
  const MakeAnOrderBottomSheetBody({super.key, this.subTitle, this.title});

  @override
  State<MakeAnOrderBottomSheetBody> createState() =>
      _MakeAnOrderBottomSheetBodyState();
}

class _MakeAnOrderBottomSheetBodyState
    extends State<MakeAnOrderBottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(4),
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
            Text(
                textAlign: TextAlign.center,
                widget.title ?? S.of(context).successfullyMakeOrder,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.black,
                )),
            if (widget.subTitle != null)
              SizedBox(height: SizeConfig.bodyHeight * .02),
            if (widget.subTitle != null)
              Text(
                textAlign: TextAlign.center,
                widget.subTitle!,
                style: AppStyles.textStyle12_700Grey,
              ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomButton(
                color: AppColors.black,
                borderColor: AppColors.black,
                titleColor: Colors.white,
                title: S.of(context).goToHome,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}
