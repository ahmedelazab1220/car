import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/my_services/presentation/widgets/my_services_view_controller.dart';
import 'package:car_help/features/widgets/tabbar_2.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyServicesViewBody extends StatelessWidget {
  const MyServicesViewBody({super.key});

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
        return MyServicesViewController(
          orderStatus: orderStatus[index],
        );
      });
    }

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).myServices,
                style: AppStyles.textStyle18_900,
              ),
            ),
          ],
        ),
        Expanded(
          child: Tabbar2(views: getViews(), tabs: getTabs()),
        ),
      ],
    );
  }
}
