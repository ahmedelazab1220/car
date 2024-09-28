import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/presentation/widgets/delete_exhibit_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ExhibitsHelper {
  static Future<void> showBottomSheetDialog(
      {required BuildContext context, required ExhibitsEntity data}) async {
    showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      builder: (context) => Container(
        height: SizeConfig.bodyHeight * .4,
        width: double.infinity,
        margin: screenPadding(),
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: DeleteExhibitBottomSheetBody(
          data: data,
        ),
      ),
    );
  }
}
