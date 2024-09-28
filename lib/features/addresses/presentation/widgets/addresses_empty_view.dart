import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/addresses/presentation/widgets/add_address_bottom_sheet_body.dart';
import 'package:car_help/features/settings/presentation/settings_helper.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddressesEmptyView extends StatelessWidget {
  const AddressesEmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.addressIcon,
              ),
              const SizedBox(height: 20),
              Text(
                S.of(context).noAddresses,
                style: AppStyles.textStyle16_800,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: CustomButton(
                    title: S.of(context).addAddress,
                    onPressed: () {
                      SettingsHelper.showBottomSheetDialog(
                          context: context,
                          widget: const AddAddressBottomSheetBody());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
