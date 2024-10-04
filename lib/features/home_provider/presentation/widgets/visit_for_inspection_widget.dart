import 'dart:io';

import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_provider/presentation/manager/send%20offer%20cubit/send_offer_cubit.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/orders_helper.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_download_pdf.dart';
import 'package:car_help/features/widgets/custom_picker_image.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitForInspectionWidget extends StatefulWidget {
  final OrderEntity data;
  const VisitForInspectionWidget({super.key, required this.data});

  @override
  State<VisitForInspectionWidget> createState() =>
      _VisitForInspectionWidgetState();
}

class _VisitForInspectionWidgetState extends State<VisitForInspectionWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();
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
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Text(
              S.of(context).determineThePrice,
              style: AppStyles.textStyle12_700Grey,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
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
                          offerType: 'check',
                          orderId: widget.data.id,
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
                      OrdersHelper.showBottomSheetDialog(
                        context: context,
                        orderStatuse: widget.data.orderStatus,
                        data: widget.data,
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
