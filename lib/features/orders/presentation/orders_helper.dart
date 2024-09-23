import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/orders/presentation/widgets/Rating_order_bottom_sheet_body.dart';
import 'package:car_help/features/orders/presentation/widgets/accepted_offer_bottom_sheet_body.dart';
import 'package:car_help/features/orders/presentation/widgets/cancelling_order_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OrdersHelper {
  static Future<void> showBottomSheetDialog({
    required BuildContext context,
    required int requestStatusIndex,
  }) async {
    showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      builder: (context) => Container(
        height: requestStatusIndex == 0
            ? SizeConfig.bodyHeight * .68
            : requestStatusIndex == 1
                ? SizeConfig.bodyHeight * .6
                : SizeConfig.bodyHeight * .4,
        width: double.infinity,
        margin: screenPadding(),
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: requestStatusIndex == 0
            ? const CancellingOrderBottomSheetBody()
            : requestStatusIndex == 1
                ? const RatingOrderBottomSheetBody()
                : const AcceptedOfferBottomSheetBody(),
      ),
    );
  }
}
