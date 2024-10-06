import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/home_client/presentation/widgets/loading_list_view.dart';
import 'package:car_help/features/my_services/presentation/manager/my%20services%20cubit/my_services_cubit.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyServicesViewController extends StatefulWidget {
  final String? orderStatus;

  const MyServicesViewController({
    super.key,
    this.orderStatus,
  });

  @override
  State<MyServicesViewController> createState() =>
      _MyServicesViewControllerState();
}

class _MyServicesViewControllerState extends State<MyServicesViewController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<MyServicesCubit>(context).getMyService();
      },
      child: BlocBuilder<MyServicesCubit, MyServicesState>(
        builder: (context, state) {
          if (state is MyServicesLoading) {
            return const LoadingListView();
          } else if (state is MyServicesFailure) {
            return FailuresWidget(
              errorMessage: state.errorMessage,
              viewIcon: false,
            );
          } else if (state is MyServicesSuccess) {
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
