import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/my_cars/presentation/my_cars_helper.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyCarsEmptyView extends StatelessWidget {
  const MyCarsEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.emptyCars),
            const SizedBox(height: 20),
            Text(
              S.of(context).noCars,
              style: AppStyles.textStyle16_800,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: CustomButton(
                  title: S.of(context).addACar,
                  onPressed: () {
                    MyCarsHelper.showBottomSheetDialog(context: context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
