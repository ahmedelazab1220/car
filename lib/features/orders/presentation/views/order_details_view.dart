import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/features/orders/presentation/orders_helper.dart';
import 'package:car_help/features/orders/presentation/widgets/exhibit_order_details_view_body.dart';
import 'package:car_help/features/orders/presentation/widgets/general_order_details_view_body.dart';
import 'package:car_help/features/orders/presentation/widgets/special_order_details_view_body.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  final int typeRequestIndex;
  final int requestStatusIndex;
  const OrderDetailsView(
      {super.key,
      required this.typeRequestIndex,
      required this.requestStatusIndex});

  @override
  Widget build(BuildContext context) {
    List views = [
      ExhibitOrderDetailsViewBody(
        requestStatusIndex: requestStatusIndex,
      ),
      SpecialOrderDetailsViewBody(
        requestStatusIndex: requestStatusIndex,
      ),
      GeneralOrderDetailsViewBody(
        requestStatusIndex: requestStatusIndex,
      )
    ];
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: context.localizations.orderDetails,
      // ),
      body: views[typeRequestIndex],
      bottomSheet: requestStatusIndex <= 1
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButton(
                color: requestStatusIndex == 0
                    ? AppColors.black
                    : AppColors.primary,
                borderColor: requestStatusIndex == 0
                    ? AppColors.black
                    : AppColors.primary,
                titleColor:
                    requestStatusIndex == 0 ? AppColors.white : AppColors.black,
                title: requestStatusIndex == 0
                    ? S.of(context).cancellingOrder
                    : S.of(context).received,
                onPressed: () => OrdersHelper.showBottomSheetDialog(
                  context: context,
                  requestStatusIndex: requestStatusIndex,
                ),
              ),
            )
          : null,
    );
  }
}
