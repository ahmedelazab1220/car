import 'dart:io';

import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_download_pdf.dart';
import 'package:car_help/features/widgets/custom_picker_image.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:car_help/core/utils/app_size.dart';

class AddExhibitViewBody extends StatefulWidget {
  final ExhibitsEntity? data;
  const AddExhibitViewBody({super.key, this.data});

  @override
  State<AddExhibitViewBody> createState() => _AddExhibitViewBodyState();
}

class _AddExhibitViewBodyState extends State<AddExhibitViewBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController priceAfterDiscount = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController detailes = TextEditingController();

  List<Future<File>> works = [];
  List<String> worksString = [];
  @override
  void initState() {
    _initVariables();
    super.initState();
  }

  Future<void> _initVariables() async {
    name.text = widget.data?.title ?? '';
    price.text = widget.data?.price.toString() ?? '';
    priceAfterDiscount.text = widget.data?.priceAfterDiscount == null
        ? ''
        : widget.data!.priceAfterDiscount.toString();
    quantity.text = widget.data?.qty.toString() ?? '';
    detailes.text = widget.data?.description ?? '';
    works = widget.data!.images!.map((e) async => await uriToFile(e)).toList();
    worksString = widget.data!.images!.map((e) => e.toString()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: name,
                labelText: S.of(context).exhibitName,
                hintText: S.of(context).enterExhibitName,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth * .43,
                    child: CustomTextFormField(
                      type: TextInputType.number,
                      controller: price,
                      labelText: S.of(context).exhibitPrice,
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
                      controller: priceAfterDiscount,
                      labelText: S.of(context).priceAfterDiscount,
                      hintText: S.of(context).enterPrice,
                      validate: (value) => value!.isEmpty
                          ? S.of(context).feildRequiredValidation
                          : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                type: TextInputType.number,
                controller: quantity,
                labelText: S.of(context).quantity,
                hintText: S.of(context).enterQuantity,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                maxLines: 4,
                controller: detailes,
                labelText: S.of(context).exhibitDetails,
                hintText: S.of(context).enterExhibitDetails,
                validate: (value) => value!.isEmpty
                    ? S.of(context).feildRequiredValidation
                    : null,
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
              SizedBox(height: SizeConfig.bodyHeight * .2),
              CustomButton(
                  title: S.of(context).create,
                  onPressed: () => formKey.currentState!.validate()),
              SizedBox(height: SizeConfig.bodyHeight * .02),
            ],
          ),
        ),
      ),
    );
  }
}
