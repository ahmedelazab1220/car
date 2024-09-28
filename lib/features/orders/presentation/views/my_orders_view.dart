import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/orders/presentation/views/orders_view.dart';
import 'package:car_help/features/widgets/tabbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      S.of(context).exhibitRequests,
      S.of(context).specialRequests,
      S.of(context).generalRequests,
    ];

    final List<String> orderType = [
      AppStrings.exhibited,
      AppStrings.private,
      AppStrings.public
    ];

    List<Widget> getTabs() {
      return tabs.map((label) => Tab(height: 65, text: label)).toList();
    }

    List<Widget> getViews() {
      return List<Widget>.generate(tabs.length, (index) {
        return OrdersView(orderType: orderType[index]);
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      S.of(context).orders,
                      style: AppStyles.textStyle18_900,
                    ),
                  ),
                ],
              ),
              Tabbar(views: getViews(), tabs: getTabs())
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.add,
          color: AppColors.black,
        ),
        onPressed: () {
          // GoRouter.of(context).push(AppRouter.kCategoryDetailsView);
        },
      ),
    );
  }
}
