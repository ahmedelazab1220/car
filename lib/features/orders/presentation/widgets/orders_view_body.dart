import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_list_view.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrdersViewBody extends StatelessWidget {
  final String? orderType;
  final String? orderStatus;
  final List<OrderEntity> data;
  const OrdersViewBody({
    super.key,
    this.orderType,
    this.orderStatus,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.emptyRequestes),
            const SizedBox(height: 20, width: double.maxFinite),
            Text(
              S.of(context).noRequestes,
              style: AppStyles.textStyle16_800,
            ),
          ],
        ),
      );
    } else {
      return OrdersListView(
        data: data,
        orderStatuse: orderStatus,
        orderType: orderType,
      );
    }
  }
}
