import 'dart:io';

import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/home_provider/presentation/manager/send%20offer%20cubit/send_offer_cubit.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_download_pdf.dart';
import 'package:car_help/features/widgets/custom_picker_image.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceSubmissionWidget extends StatefulWidget {
  final OrderEntity data;
  const PriceSubmissionWidget({super.key, required this.data});

  @override
  State<PriceSubmissionWidget> createState() => _PriceSubmissionWidgetState();
}

class _PriceSubmissionWidgetState extends State<PriceSubmissionWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController lowPrice = TextEditingController();
  TextEditingController highPrice = TextEditingController();
  TextEditingController comment = TextEditingController();
  File? imageFile;
  String? imageName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth * .43,
                  child: CustomTextFormField(
                    type: TextInputType.number,
                    controller: lowPrice,
                    labelText: S.of(context).from,
                    hintText: S.of(context).enterPrice,
                    validate: (value) => value!.isEmpty
                        ? S.of(context).feildRequiredValidation
                        : null,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth * .43,
                  child: CustomTextFormField(
                    type: TextInputType.number,
                    controller: highPrice,
                    labelText: S.of(context).to,
                    hintText: S.of(context).enterPrice,
                    validate: (value) => value!.isEmpty
                        ? S.of(context).feildRequiredValidation
                        : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .04),
            CustomTextFormField(
              maxLines: 4,
              controller: comment,
              labelText: S.of(context).comments,
              hintText: S.of(context).enterComments,
              validate: (value) =>
                  value!.isEmpty ? S.of(context).feildRequiredValidation : null,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .03),
            if (imageFile == null)
              CustomPickerImages(
                onImageSelected: (File? file, String? fileName) {
                  if (file != null && fileName != null) {
                    setState(() {
                      imageFile = file;
                      imageName = fileName;
                    });
                  } else {}
                },
              ),
            if (imageName != null)
              CustomPDFWidget(
                onTap: () {
                  setState(() {
                    imageFile = null;
                    imageName = null;
                  });
                },
                title: imageName,
              ),
            SizedBox(height: SizeConfig.bodyHeight * .06),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    width: SizeConfig.screenWidth * .43,
                    margin: EdgeInsets.zero,
                    color: AppColors.primary,
                    borderColor: AppColors.primary,
                    titleColor: AppColors.black,
                    title: S.of(context).sendTheOffer,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SendOfferCubit>(context).sendOffer(
                          offerType: 'approximate',
                          orderId: widget.data.id,
                          lowPrice: double.tryParse(lowPrice.text),
                          highPrice: double.tryParse(highPrice.text),
                          description: comment.text,
                          image: imageFile,
                        );
                      }
                    }),
                CustomButton(
                    width: SizeConfig.screenWidth * .43,
                    margin: EdgeInsets.zero,
                    color: AppColors.black,
                    borderColor: AppColors.black,
                    titleColor: AppColors.white,
                    title: S.of(context).rejectTheRequest,
                    onPressed: () {
                      // OrdersHelper.showBottomSheetDialog(
                      //   context: context,
                      //   orderStatuse: data.orderStatus,
                      //   data: data,
                      // );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
