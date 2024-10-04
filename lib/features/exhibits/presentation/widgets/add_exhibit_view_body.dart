import 'dart:io';

import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/presentation/manager/exhibits%20cubit/exhibits_cubit.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_download_pdf.dart';
import 'package:car_help/features/widgets/custom_picker_image.dart';
import 'package:car_help/features/widgets/custom_text_form_field.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  List<Future<File>> images = [];
  List<String> imagesString = [];
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
    images =
        widget.data?.images?.map((e) async => await uriToFile(e)).toList() ??
            [];
    imagesString = widget.data?.images?.map((e) => e.toString()).toList() ?? [];
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
              if (images.length <= 4)
                CustomPickerImages(
                  onImageSelected: (File? file, String? fileName) {
                    if (file != null && fileName != null) {
                      setState(() {
                        images.add(Future.value(file));
                        imagesString.add(fileName);
                      });
                    } else {}
                  },
                ),
              if (imagesString.isNotEmpty)
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: imagesString.length,
                    itemBuilder: (context, index) {
                      return CustomPDFWidget(
                        onTap: () {
                          setState(() {
                            images.removeAt(index);
                            imagesString.removeAt(index);
                          });
                        },
                        urlString: imagesString[index] == 'name'
                            ? null
                            : imagesString[index],
                        title: imagesString[index],
                      );
                    }),
              SizedBox(height: SizeConfig.bodyHeight * .05),
              CustomButton(
                  title: widget.data == null
                      ? S.of(context).create
                      : S.of(context).edit,
                  color: images.isNotEmpty
                      ? AppColors.primary
                      : AppColors.hint.withOpacity(0.5),
                  onPressed: images.isNotEmpty
                      ? () async {
                          if (formKey.currentState!.validate()) {
                            if (widget.data == null) {
                              BlocProvider.of<ExhibitsCubit>(context)
                                  .addExhibits(
                                title: name.text,
                                price: num.tryParse(
                                  price.text,
                                ),
                                priceAfterDiscount:
                                    num.tryParse(priceAfterDiscount.text),
                                qty: int.tryParse(quantity.text),
                                description: detailes.text,
                                images: await Future.wait(images),
                              );
                            } else {
                              BlocProvider.of<ExhibitsCubit>(context)
                                  .updateExhibits(
                                id: widget.data!.id,
                                title: name.text,
                                price: num.tryParse(
                                  price.text,
                                ),
                                priceAfterDiscount:
                                    num.tryParse(priceAfterDiscount.text),
                                qty: int.tryParse(quantity.text),
                                description: detailes.text,
                                images: await Future.wait(images),
                              );
                            }
                          }
                        }
                      : null),
              SizedBox(height: SizeConfig.bodyHeight * .02),
            ],
          ),
        ),
      ),
    );
  }
}
