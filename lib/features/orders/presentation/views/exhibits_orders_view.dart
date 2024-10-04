import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/orders/presentation/widgets/exhibits_orders_view_controller.dart';
import 'package:car_help/features/widgets/tabbar_2.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class ExhibitsOrdersView extends StatelessWidget {
  const ExhibitsOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      S.of(context).newRequests,
      S.of(context).onGoing,
      S.of(context).completed,
      S.of(context).canceled,
    ];
    final List<String> orderStatus = [
      AppStrings.pending,
      AppStrings.inProgress,
      AppStrings.completed,
      AppStrings.canceled,
    ];

    List<Widget> getTabs() {
      return tabs.map((label) => Tab(text: label)).toList();
    }

    List<Widget> getViews() {
      return List<Widget>.generate(tabs.length, (index) {
        return ExhibitsOrdersViewController(
          orderStatus: orderStatus[index],
        );
      });
    }

    return Tabbar2(views: getViews(), tabs: getTabs());
  }
}

