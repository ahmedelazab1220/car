import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/home_client/presentation/widgets/loading_list_view.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/manager/special%20orders%20cubit/special_orders_cubit.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialOrdersViewController extends StatefulWidget {
  final String? orderStatus;

  const SpecialOrdersViewController({
    super.key,
    this.orderStatus,
  });

  @override
  State<SpecialOrdersViewController> createState() =>
      _SpecialOrdersViewControllerState();
}

class _SpecialOrdersViewControllerState
    extends State<SpecialOrdersViewController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<SpecialOrdersCubit>(context).getMyOrders();
      },
      child: BlocBuilder<SpecialOrdersCubit, SpecialOrdersState>(
        builder: (context, state) {
          if (state is SpecialOrdersLoading) {
            return const LoadingListView();
          } else if (state is SpecialOrdersFailure) {
            return FailuresWidget(
              errorMessage: state.errorMessage,
              viewIcon: false,
            );
          } else if (state is SpecialOrdersSuccess) {
            List<OrderEntity> orderEntities = [];
            if (widget.orderStatus == AppStrings.pending) {
              orderEntities.addAll(state.pending);
            } else if (widget.orderStatus == AppStrings.inProgress) {
              orderEntities.addAll(state.inProgress);
            } else if (widget.orderStatus == AppStrings.completed) {
              orderEntities.addAll(state.completed);
            } else if (widget.orderStatus == AppStrings.canceled) {
              orderEntities.addAll(state.canceled);
            }
            return OrdersViewBody(
              orderType: AppStrings.private,
              orderStatus: widget.orderStatus,
              data: orderEntities,
            );
          }

          return const Center(
            child: Text('Somthing Was Rong'),
          );
        },
      ),
    );
  }
}
