import 'package:car_help/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:car_help/features/widgets/tabbar_2.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  final int typeRequestIndex;
  const OrdersView({super.key, required this.typeRequestIndex});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      S.of(context).newRequests,
      S.of(context).onGoing,
      S.of(context).completed,
      S.of(context).canceled,
    ];

    List<Widget> getTabs() {
      return tabs.map((label) => Tab(text: label)).toList();
    }

    List<Widget> getViews() {
      return List<Widget>.generate(tabs.length, (index) {
        return OrdersViewBody(
          typeRequestIndex: typeRequestIndex,
          requestStatusIndex: index,
        );
      });
    }

    return Tabbar2(views: getViews(), tabs: getTabs());
  }
}
