import 'dart:io';

import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/auth/presentation/widgets/address_register_widget.dart';
import 'package:car_help/features/lists/presentation/controllers/multi_select_classification_controller.dart';
import 'package:car_help/features/lists/presentation/manager/districts%20cubit/districts_cubit.dart';
import 'package:car_help/features/location/domain/entities/location_entity.dart';
import 'package:car_help/features/profile/Presentation/manager/edit%20cubit/edit_profile_cubit.dart';
import 'package:car_help/features/settings/presentation/settings_helper.dart';
import 'package:car_help/features/settings/presentation/widgets/delete_account_bottom_sheet_body.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_download_pdf.dart';
import 'package:car_help/features/widgets/custom_picker_image.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileProviderViewBody extends StatefulWidget {
  final UserEntity data;
  const EditProfileProviderViewBody({super.key, required this.data});

  @override
  State<EditProfileProviderViewBody> createState() =>
      _EditProfileProviderViewBodyState();
}

class _EditProfileProviderViewBodyState
    extends State<EditProfileProviderViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController companyName = TextEditingController();
  TextEditingController commercialRegistrationNumber = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController addressController = TextEditingController();

  int? city, district;
  double? lat, lng;
  List<int> categoryIds = [];
  List<Future<File>> works = [];
  List<String> worksString = [];
  bool isAgree = false;
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    _initVariables();
  }

  Future<void> _initVariables() async {
    companyName.text = widget.data.name ?? '';
    phoneNumber.text =
        widget.data.phone != null && widget.data.phone!.length >= 4
            ? widget.data.phone!.substring(4, widget.data.phone!.length)
            : '';
    commercialRegistrationNumber.text = widget.data.commercialRegister ?? '';
    categoryIds = widget.data.categories!.map((e) => e.id!).toList();
    addressController.text = widget.data.address ?? '';
    lat = widget.data.lat;
    lng = widget.data.lng;
    city = widget.data.city?.id;
    district = widget.data.district?.id;
    works =
        widget.data.gallery?.map((e) async => await uriToFile(e)).toList() ??
            [];
    worksString = widget.data.gallery?.map((e) => e.toString()).toList() ?? [];
    BlocProvider.of<DistrictsCubit>(context)
        .getDistricts(id: widget.data.city?.id);
  }

  void _updateIsValid() {
    setState(() {
      isValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          onChanged: _updateIsValid,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                controller: companyName,
                labelText: S.of(context).centerName,
                hintText: S.of(context).enterCenterName,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                controller: commercialRegistrationNumber,
                type: TextInputType.number,
                labelText: S.of(context).commercialRegister,
                hintText: S.of(context).enterCommercialRegister,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              MultiSelectClassificationController(
                selectedIds: widget.data.categories ?? [],
                onSelectedIds: (selectedIds) {
                  setState(() {
                    categoryIds = selectedIds;
                  });
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AddressRegisterWidget(
                data: widget.data,
                onSelectedCityId: (selectedId) {
                  setState(() {
                    city = selectedId;
                  });
                  BlocProvider.of<DistrictsCubit>(context)
                      .getDistricts(id: selectedId);
                },
                onSelectedDistrictId: (selectedId) {
                  setState(() {
                    district = selectedId;
                  });
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                  controller: addressController,
                  labelText: S.of(context).additionalAddressDetails,
                  hintText: S.of(context).enterCommercialRegister,
                  validate: (value) => value!.isEmpty
                      ? S.of(context).feildRequiredValidation
                      : null,
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRouter.kPickLocationScreen)
                        .then((value) {
                      if (value != null) {
                        LocationEntity locationEntity = value as LocationEntity;
                        String address = locationEntity.address ?? "";
                        addressController.text = address;
                        lat = locationEntity.latitude;
                        lng = locationEntity.longitude;
                      }
                    });
                  }),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                controller: phoneNumber,
                prefixText: "+966  ",
                labelText: S.of(context).phoneNumber,
                hintText: S.of(context).enterYourPhoneNumber,
                type: TextInputType.phone,
                validate: (value) =>
                    value!.isEmpty ? S.of(context).phoneNumberValidation : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              if (works.length <= 4)
                CustomPickerImages(
                  onImageSelected: (File? file, String? fileName) {
                    if (file != null && fileName != null) {
                      setState(() {
                        works.add(Future.value(file));
                        worksString.add(fileName);
                      });
                    } else {}
                  },
                ),
              if (worksString.isNotEmpty)
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: worksString.length,
                    itemBuilder: (context, index) {
                      return CustomPDFWidget(
                        onTap: () {
                          setState(() {
                            works.removeAt(index);
                            worksString.removeAt(index);
                          });
                        },
                        urlString: worksString[index] == 'name'
                            ? null
                            : worksString[index],
                        title: worksString[index],
                      );
                    }),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomButton(
                  margin: const EdgeInsets.all(0),
                  title: S.of(context).save,
                  onPressed: () async {
                    BlocProvider.of<EditProfileCubit>(context).editProfileData(
                      name: companyName.text.trim(),
                      phone: phoneNumber.text.trim(),
                      address: addressController.text.trim(),
                      cityId: city,
                      districtId: district,
                      lat: lat,
                      lng: lng,
                      commercialRegister:
                          commercialRegistrationNumber.text.trim(),
                      categoryIds: categoryIds,
                      works: await Future.wait(works),
                    );
                  }),
              SizedBox(
                height: SizeConfig.bodyHeight * 0.02,
              ),
              TextButton(
                onPressed: () => SettingsHelper.showBottomSheetDialog(
                  context: context,
                  widget: const DeleteAccountBottomSheetBody(),
                ),
                child: Text(
                  S.of(context).deleteAccount,
                  style: AppStyles.textStyle16_700Grey.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
