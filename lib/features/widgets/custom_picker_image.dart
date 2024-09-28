import 'dart:io';

import 'package:car_help/config/theme/app_theme.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class CustomPickerImages extends StatefulWidget {
  const CustomPickerImages({
    super.key,
    required this.onImageSelected,
  });
  final void Function(File?, String?) onImageSelected;

  @override
  State<CustomPickerImages> createState() => _CustomPickerImagesState();
}

class _CustomPickerImagesState extends State<CustomPickerImages> {
  File? imageFile;
  Color? color = AppColors.primary;
  String? imageName;

  @override
  Widget build(BuildContext context) {
    Widget checkImage() {
      // if (imageFile == null) {
      return Text(S.of(context).attachPhotos, style: AppStyles.textStyle12_600);
      // } else {
      //   return Text(
      //     imagePath,
      //     style: AppStyles.textStyle12_600
      //         .copyWith(decoration: TextDecoration.underline),
      //   );
      // }
    }

    return Container(
      height: 65,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(40)),
      child: InkWell(
        onTap: () => getImage(source: ImageSource.gallery),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              checkImage(),
              const Spacer(),
              SvgPicture.asset(AppAssets.fileUpload)
            ],
          ),
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        color = AppColors.primary;
        imageFile = File(file!.path);
        imageName = basename(file.path);
      });
      widget.onImageSelected(imageFile, imageName);
    }
  }
}
