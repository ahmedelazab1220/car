import 'package:car_help/core/utils/app_constant.dart';
import 'package:car_help/features/home_provider/presentation/views/customer_orders_details_view.dart';
import 'package:car_help/features/home_provider/presentation/widgets/customer_orders_card.dart';
import 'package:flutter/material.dart';

class CustomerOrdersListView extends StatelessWidget {
  const CustomerOrdersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: 5,
          itemBuilder: (context, index) {
            return CustomerOrdersCard(onTap: () {}
                // AppConstant.navigateTo(
                //   context,
                //   const CustomerOrdersDetailsView(),
                // ),
                );
          },
        ),
      ),
    );
  }
}
