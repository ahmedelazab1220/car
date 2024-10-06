// ignore_for_file: use_build_context_synchronously

import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/addresses/domain/entities/address_entity.dart';
import 'package:car_help/features/addresses/presentation/widgets/add_address_bottom_sheet_body.dart';
import 'package:car_help/features/addresses/presentation/widgets/address_card.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/settings/presentation/settings_helper.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddressesViewBody extends StatefulWidget {
  final List<AddressEntity> data;
  const AddressesViewBody({super.key, required this.data});

  @override
  State<AddressesViewBody> createState() => _AddressesViewBodyState();
}

class _AddressesViewBodyState extends State<AddressesViewBody> {
  TextEditingController addressController = TextEditingController();
  double? lat, lng;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Text(
                    '${S.of(context).thereAre} ${widget.data.length} ${S.of(context).addressForYou}',
                    style: AppStyles.textStyle14_800Black,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: widget.data.length,
                      itemBuilder: (context, index) {
                        return AddressCard(
                          data: widget.data[index],
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.add,
          color: AppColors.black,
        ),
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
                ),
              );
            }
          });
        },
      ),
    );
  }
}
