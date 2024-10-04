import 'package:car_help/features/home_provider/presentation/widgets/custmer_order_details_view_controller.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/widgets/custom_app_bar%20copy.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';

class CustomerOrdersDetailsView extends StatelessWidget {
  final OrderEntity data;
  const CustomerOrdersDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).orderDetails,
        ),
        body: CustomerOrderDetailsViewController(
          data: data,
        ));
  }
}
