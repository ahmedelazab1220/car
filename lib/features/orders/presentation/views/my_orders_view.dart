import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:car_help/features/orders/presentation/manager/exhibits%20orders%20cubit/exhibits_orders_cubit.dart';
import 'package:car_help/features/orders/presentation/manager/general%20orders%20cubit/general_orders_cubit.dart';
import 'package:car_help/features/orders/presentation/manager/special%20orders%20cubit/special_orders_cubit.dart';
import 'package:car_help/features/orders/presentation/views/exhibits_orders_view.dart';
import 'package:car_help/features/orders/presentation/views/general_orders_view.dart';
import 'package:car_help/features/orders/presentation/views/special_orders_view.dart';
import 'package:car_help/features/widgets/tabbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      S.of(context).exhibitRequests,
      S.of(context).specialRequests,
      S.of(context).generalRequests,
    ];

    // final List<String> orderType = [
    //   AppStrings.exhibited,
    //   AppStrings.private,
    //   AppStrings.public
    // ];

    List<Widget> getTabs() {
      return tabs.map((label) => Tab(height: 65, text: label)).toList();
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ExhibitsOrdersCubit(getIt.get<OrdersRepo>())..getMyOrders()),
        BlocProvider(
            create: (context) =>
                SpecialOrdersCubit(getIt.get<OrdersRepo>())..getMyOrders()),
        BlocProvider(
            create: (context) =>
                GeneralOrdersCubit(getIt.get<OrdersRepo>())..getMyOrders())
      ],
      child: Scaffold(
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
                Tabbar(views: const [
                  ExhibitsOrdersView(),
                  SpecialOrdersView(),
                  GeneralOrdersView()
                ], tabs: getTabs())
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
            GoRouter.of(context).push(AppRouter.kMakePublicOrder);
          },
        ),
      ),
    );
  }
}
