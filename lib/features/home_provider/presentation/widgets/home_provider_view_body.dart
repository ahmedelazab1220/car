import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_provider/presentation/widgets/customer_orders_list_view.dart';
import 'package:car_help/features/home_provider/presentation/widgets/home_provider_controller.dart';
import 'package:car_help/features/home_provider/presentation/widgets/statistics_card.dart';
import 'package:car_help/features/widgets/custom_home_appbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeProviderViewBody extends StatelessWidget {
  const HomeProviderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomHomeAppBar(
            title: 'أهلا بك عميلنا العزيز',
          ),
          const HomeProviderController(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.of(context).customerOrders,
              style: AppStyles.textStyle14_700Black,
            ),
          ),
          const CustomerOrdersListView(),
        ],
      ),
    );
  }
}
