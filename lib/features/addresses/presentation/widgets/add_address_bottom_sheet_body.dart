import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/addresses/domain/entities/address_entity.dart';
import 'package:car_help/features/addresses/presentation/manager/addresses%20cubit/addresses_cubit.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/profile/Presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddAddressBottomSheetBody extends StatefulWidget {
  final LocationEntity? location;
  const AddAddressBottomSheetBody({super.key, this.location});

  @override
  State<AddAddressBottomSheetBody> createState() =>
      _AddAddressBottomSheetBodyState();
}

class _AddAddressBottomSheetBodyState extends State<AddAddressBottomSheetBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController addressController = TextEditingController();
  double? lat, lng;
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfileData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          name.text = state.data?.name ?? '';
          phone.text =
              state.data?.phone != null && state.data!.phone!.length >= 4
                  ? state.data!.phone!.substring(4, state.data?.phone!.length)
                  : '';
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppAssets.location,
                        ),
                        const SizedBox(width: 6),
                        SizedBox(
                          width: SizeConfig.screenWidth * .65,
                          child: Text(
                            widget.location?.address ?? '',
                            style: AppStyles.textStyle14_700Black,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomTextFormField(
                    controller: name,
                    labelText: S.of(context).fullName,
                    hintText: S.of(context).fullNameHint,
                    validate: (value) => value!.isEmpty
                        ? S.of(context).fullNameValidation
                        : null,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  CustomTextFormField(
                    controller: phone,
                    prefixText: "+966  ",
                    labelText: S.of(context).phoneNumber,
                    hintText: S.of(context).enterYourPhoneNumber,
                    type: TextInputType.phone,
                    validate: (value) => value!.isEmpty
                        ? S.of(context).phoneNumberValidation
                        : null,
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .04),
                  CustomButton(
                      margin: EdgeInsets.zero,
                      color: AppColors.black,
                      borderColor: AppColors.black,
                      titleColor: Colors.white,
                      title: S.of(context).addAddress,
                      onPressed: () => {
                            if (formKey.currentState!.validate())
                              BlocProvider.of<AddressesCubit>(context)
                                  .addAddress(
                                      address: AddressEntity(
                                ownerName: name.text,
                                ownerPhone: '+964${phone.text}',
                                address: widget.location?.address ?? '',
                                lat:
                                    widget.location?.latitude?.toString() ?? '',
                                lng:
                                    widget.location?.longitude.toString() ?? '',
                                isDefault: 1,
                              )),
                            Navigator.pop(context),
                          }),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Center(
                      child: AppText(
                        text: S.of(context).cancel,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        textSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.bodyHeight * .02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
