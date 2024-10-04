import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/home_client/presentation/widgets/loading_list_view.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/manager/general%20orders%20cubit/general_orders_cubit.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralOrdersViewController extends StatefulWidget {
  final String? orderStatus;

  const GeneralOrdersViewController({
    super.key,
    this.orderStatus,
  });

  @override
  State<GeneralOrdersViewController> createState() =>
      _GeneralOrdersViewControllerState();
}

class _GeneralOrdersViewControllerState
    extends State<GeneralOrdersViewController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<GeneralOrdersCubit>(context).getMyOrders();
      },
      child: BlocBuilder<GeneralOrdersCubit, GeneralOrdersState>(
        builder: (context, state) {
          if (state is GeneralOrdersLoading) {
            return const LoadingListView();
          } else if (state is GeneralOrdersFailure) {
            return FailuresWidget(
              errorMessage: state.errorMessage,
              viewIcon: false,
            );
          } else if (state is GeneralOrdersSuccess) {
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
              orderType: AppStrings.public,
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
