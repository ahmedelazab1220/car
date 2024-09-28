import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/day_working_hours.dart';
import 'package:car_help/features/home_client/presentation/widgets/loading_list_view.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:car_help/features/orders/presentation/manager/orders%20cubit/orders_cubit.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_list_view.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class OrdersController extends StatefulWidget {
  final String? orderStatuse;
  final String? orderType;
  const OrdersController({
    super.key,
    this.orderStatuse,
    this.orderType,
  });

  @override
  State<OrdersController> createState() => _OrdersControllerState();
}

class _OrdersControllerState extends State<OrdersController> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit(getIt.get<OrdersRepo>())
        ..getMyOrders(
            orderStatuse: widget.orderStatuse, orderType: widget.orderType),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const LoadingListView();
          } else if (state is OrdersFailure) {
            return FailuresWidget(
              errorMessage: state.errorMessage,
              viewIcon: false,
            );
          } else if (state is OrdersSuccess) {
            if (state.data.isEmpty) {
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
            } else {
              return OrdersListView(
                data: state.data,
                orderStatuse: widget.orderStatuse,
                orderType: widget.orderType,
              );
            }
          }

          return const Center(
            child: Text('Somthing Was Rong'),
          );
        },
      ),
    );
  }
}
