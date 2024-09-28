import 'dart:io';

import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/lists/presentation/controllers/addresses_controller.dart';
import 'package:car_help/features/lists/presentation/controllers/center_classification_controller.dart';
import 'package:car_help/features/lists/presentation/controllers/my_cars_controller.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_download_pdf.dart';
import 'package:car_help/features/widgets/custom_picker_image.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';

class MakeOrderWidget extends StatefulWidget {
  const MakeOrderWidget({super.key});

  @override
  State<MakeOrderWidget> createState() => _MakeOrderWidgetState();
}

class _MakeOrderWidgetState extends State<MakeOrderWidget> {
  final GlobalKey<FormState> formKey = GlobalKey();

  List<Future<File>> works = [];
  List<String> worksString = [];
  bool isValid = false;

  void _updateIsValid() {
    setState(() {
      isValid = formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController orderDetails = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        onChanged: _updateIsValid,
        child: Column(
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            MyCarsController(onSelectedId: (value) {}),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AddressesController(onSelectedId: (value) {}),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            CenterClassificationController(onSelectedIds: (value) {}),
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
                onPressed: () => formKey.currentState!.validate()),
            SizedBox(height: SizeConfig.bodyHeight * .02),
          ],
        ),
      ),
    );
  }
}
