import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:car_help/features/orders/presentation/manager/order%20details%20cubit/order_details_cubit.dart';
import 'package:car_help/features/orders/presentation/widgets/order_details_view_body.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/snackbar_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OrderDetailsViewController extends StatefulWidget {
  final List list;
  const OrderDetailsViewController({super.key, required this.list});

  @override
  State<OrderDetailsViewController> createState() =>
      _OrderDetailsViewControllerState();
}

class _OrderDetailsViewControllerState
    extends State<OrderDetailsViewController> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsCubit(
        getIt.get<OrdersRepo>(),
      ),
      child: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
        listener: (context, state) {
          if (state is OrderDetailsLoading) {
            isLoading = true;
          } else if (state is OrderDetailsSuccess) {
            isLoading = false;
            snackbarSuccess(context, state.message);
          } else if (state is OrderDetailsFailure) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: OrderDetailsViewBody(
              list: widget.list,
            ),
          );
        },
      ),
    );
  }
}
