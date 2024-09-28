import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/orders/presentation/widgets/Rating_order_bottom_sheet_body.dart';
import 'package:car_help/features/orders/presentation/widgets/accepted_offer_bottom_sheet_body.dart';
import 'package:car_help/features/orders/presentation/widgets/cancelling_order_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OrdersHelper {
  static Future<void> showBottomSheetDialog({
    required BuildContext context,
    required String? orderStatuse,
  }) async {
    showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(30),
      context: context,
      builder: (context) => Material(
        child: Container(
          height: orderStatuse == AppStrings.pending
              ? SizeConfig.bodyHeight * .68
              : orderStatuse == AppStrings.inProgress
                  ? SizeConfig.bodyHeight * .6
                  : SizeConfig.bodyHeight * .4,
          width: double.infinity,
          margin: screenPadding(),
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * .04),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: orderStatuse == AppStrings.pending
              ? const CancellingOrderBottomSheetBody()
              : orderStatuse == AppStrings.inProgress
                  ? const RatingOrderBottomSheetBody()
                  : const AcceptedOfferBottomSheetBody(),
        ),
      ),
    );
  }
}
