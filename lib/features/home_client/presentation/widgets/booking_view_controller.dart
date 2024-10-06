import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/home_helper.dart';
import 'package:car_help/features/home_client/presentation/widgets/booking_view_body.dart';
import 'package:car_help/features/home_client/presentation/widgets/make_an_order_bottom_sheet_body.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:car_help/features/orders/presentation/manager/add%20order%20cubit/add_order_cubit.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BookingViewController extends StatefulWidget {
  final ProviderEntity data;
  final ExhibitsEntity dataExhibits;
  const BookingViewController({
    super.key,
    required this.data,
    required this.dataExhibits,
  });

  @override
  State<BookingViewController> createState() => _BookingViewControllerState();
}

class _BookingViewControllerState extends State<BookingViewController> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: BlocConsumer<AddOrderCubit, AddOrderState>(
        listener: (context, state) {
          if (state is AddOrderLoading) {
            isLoading = true;
          } else if (state is AddOrderSuccess) {
            isLoading = false;
            GoRouter.of(context).pop();
            HomeHelper.showBottomSheetDialog(
              context: context,
              widget: const MakeAnOrderBottomSheetBody(),
            );
          } else if (state is AddOrderFailure) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: BookingViewBody(
              data: widget.data,
              dataExhibits: widget.dataExhibits,
            ),
          );
        },
      ),
    );
  }
}
