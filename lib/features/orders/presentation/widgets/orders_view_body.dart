import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_list_view.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrdersViewBody extends StatelessWidget {
  final int typeRequestIndex;
  final int requestStatusIndex;
  const OrdersViewBody(
      {super.key,
      required this.typeRequestIndex,
      required this.requestStatusIndex});

  @override
  Widget build(BuildContext context) {
    if (4 > 0) {
      return OrdersListView(
        typeRequestIndex: typeRequestIndex,
        requestStatusIndex: requestStatusIndex,
      );
    } else {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.emptyRequestes),
            const SizedBox(height: 20),
            Text(
              S.of(context).noRequestes,
              style: AppStyles.textStyle16_800,
            ),
          ],
        ),
      );
    }
  }
}
