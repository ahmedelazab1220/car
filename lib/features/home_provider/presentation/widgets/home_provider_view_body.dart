import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_provider/presentation/manager/home%20provider%20cubit/home_provider_cubit.dart';
import 'package:car_help/features/home_provider/presentation/widgets/customer_orders_controller.dart';
import 'package:car_help/features/home_provider/presentation/widgets/home_provider_controller.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProviderViewBody extends StatelessWidget {
  const HomeProviderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HomeProviderCubit>(context).getHomeProvider();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeProviderController(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).customerOrders,
                  style: AppStyles.textStyle14_700Black,
                ),
              ),
              const CustomerOrdersController(),
            ],
          ),
        ),
      ),
    );
  }
}
