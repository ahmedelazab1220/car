import 'dart:io';

import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/lists/presentation/controllers/addresses_controller.dart';
import 'package:car_help/features/lists/presentation/controllers/my_cars_controller.dart';
import 'package:car_help/features/lists/presentation/controllers/single_select_classification_controller.dart';
import 'package:car_help/features/orders/presentation/manager/add%20order%20cubit/add_order_cubit.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_download_pdf.dart';
import 'package:car_help/features/widgets/custom_picker_image.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakeOrderWidget extends StatefulWidget {
  final ProviderEntity? data;
  final String orderType;
  const MakeOrderWidget({super.key, this.data, required this.orderType});

  @override
  State<MakeOrderWidget> createState() => _MakeOrderWidgetState();
}

class _MakeOrderWidgetState extends State<MakeOrderWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController orderDetails = TextEditingController();
  List<Future<File>> works = [];
  List<String> worksString = [];
  bool isValid = false;
  int? carId, addressId, categoryId;
  void _updateIsValid() {
    setState(() {
      isValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        onChanged: _updateIsValid,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            MyCarsController(onSelectedId: (value) {
              setState(() {
                carId = value;
              });
            }),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AddressesController(onSelectedId: (value) {
              setState(() {
                addressId = value;
              });
            }),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            SingleSelectClassificationController(
              onSelectedId: (selectedId) {
                setState(() {
                  categoryId = selectedId;
                });
              },
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CustomTextFormField(
              maxLines: 4,
              controller: orderDetails,
              labelText: S.of(context).orderDetails,
              hintText: S.of(context).orderDetailsMsg,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).feildRequiredValidation : null,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .03),
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
                  padding: EdgeInsets.zero,
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
            SizedBox(height: SizeConfig.bodyHeight * .04),
            CustomButton(
                margin: const EdgeInsets.symmetric(vertical: 20),
                color: isValid ? null : AppColors.grey.withOpacity(0.4),
                titleColor: Colors.white,
                title: S.of(context).send,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AddOrderCubit>(context).addOrder(
                        orderType: widget.orderType,
                        providerId: widget.data?.id,
                        carId: carId,
                        addressId: addressId,
                        categoryId: categoryId,
                        orderFiles: await Future.wait(works),
                        paymentMethod: 'cash');
                  }
                }),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}
