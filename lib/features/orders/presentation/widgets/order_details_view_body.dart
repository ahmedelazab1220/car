import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/orders_helper.dart';
import 'package:car_help/features/orders/presentation/widgets/exhibit_order_details_view_body.dart';
import 'package:car_help/features/orders/presentation/widgets/general_order_details_view_body.dart';
import 'package:car_help/features/orders/presentation/widgets/special_order_details_view_body.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';

class OrderDetailsViewBody extends StatefulWidget {
  final List list;

  const OrderDetailsViewBody({
    super.key,
    required this.list,
  });

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
  String? orderStatuse;
  String? orderType;
  OrderEntity? data;
  @override
  void initState() {
    orderStatuse = widget.list[0];
    orderType = widget.list[1];
    data = widget.list[2];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List views = [
      ExhibitOrderDetailsViewBody(
        orderStatuse: orderStatuse,
        data: data,
      ),
      SpecialOrderDetailsViewBody(
        orderStatuse: orderStatuse,
        data: data,
      ),
      GeneralOrderDetailsViewBody(
        orderStatuse: orderStatuse,
        data: data,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).orderDetails),
      ),
      body: views[orderType == AppStrings.exhibited
          ? 0
          : orderType == AppStrings.private
              ? 1
              : 2],
      bottomSheet: orderStatuse == AppStrings.pending ||
              orderStatuse == AppStrings.inProgress
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButton(
                color: orderStatuse == AppStrings.pending
                    ? AppColors.black
                    : AppColors.primary,
                borderColor: orderStatuse == AppStrings.pending
                    ? AppColors.black
                    : AppColors.primary,
                titleColor: orderStatuse == AppStrings.pending
                    ? AppColors.white
                    : AppColors.black,
                title: orderStatuse == AppStrings.pending
                    ? S.of(context).cancellingOrder
                    : S.of(context).received,
                onPressed: () => OrdersHelper.showBottomSheetDialog(
                  context: context,
                  orderStatuse: orderStatuse,
                  data: data,
                ),
              ),
            )
          : null,
    );
  }
}
