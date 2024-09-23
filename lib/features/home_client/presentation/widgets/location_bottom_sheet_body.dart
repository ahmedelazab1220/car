import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/addresses/presentation/widgets/add_address_bottom_sheet_body.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/settings/presentation/settings_helper.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LocationBottomSheetBody extends StatefulWidget {
  const LocationBottomSheetBody({super.key});

  @override
  State<LocationBottomSheetBody> createState() =>
      _LocationBottomSheetBodyState();
}

class _LocationBottomSheetBodyState extends State<LocationBottomSheetBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  double? lat, lng;

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
              SizedBox(height: SizeConfig.bodyHeight * .04),
              SvgPicture.asset(AppAssets.locationBottomSheet),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: S.of(context).sharingLocation,
                fontWeight: FontWeight.bold,
                textSize: 16,
                color: AppColors.black,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Text(
                textAlign: TextAlign.center,
                S.of(context).sharingLocationDesc,
                style: AppStyles.textStyle12_700Grey,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomButton(
                  borderColor: AppColors.black,
                  titleColor: AppColors.white,
                  color: AppColors.black,
                  title: S.of(context).allow,
                  onPressed: () {
                    GoRouter.of(context)
                        .push(AppRouter.kPickLocationScreen)
                        .then((value) {
                      if (value != null) {
                        LocationEntity locationEntity = value as LocationEntity;
                        String address = locationEntity.address ?? "";
                        addressController.text = address;
                        lat = locationEntity.latitude;
                        lng = locationEntity.longitude;
                        SettingsHelper.showBottomSheetDialog(
                            context: context,
                            widget: AddAddressBottomSheetBody(
                              location: locationEntity,
                            ));
                        GoRouter.of(context).pop();
                      }
                    });
                  }),
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
