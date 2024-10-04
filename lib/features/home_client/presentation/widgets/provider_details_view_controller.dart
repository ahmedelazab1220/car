import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/home_client/presentation/home_helper.dart';
import 'package:car_help/features/home_client/presentation/views/provider_details_view.dart';
import 'package:car_help/features/home_client/presentation/widgets/make_an_order_bottom_sheet_body.dart';
import 'package:car_help/features/home_client/presentation/widgets/make_order_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/provider_exhibits_controller.dart';
import 'package:car_help/features/home_client/presentation/widgets/provider_details_view_body.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:car_help/features/orders/presentation/manager/add%20order%20cubit/add_order_cubit.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/tabbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProviderDetailsViewController extends StatefulWidget {
  const ProviderDetailsViewController({
    super.key,
    required this.data,
  });

  final ProviderDetailsView data;

  @override
  State<ProviderDetailsViewController> createState() =>
      _ProviderDetailsViewControllerState();
}

class _ProviderDetailsViewControllerState
    extends State<ProviderDetailsViewController> {
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
            HomeHelper.showBottomSheetDialog(
              context: context,
              widget: MakeAnOrderBottomSheetBody(
                subTitle: S.of(context).successfullyMakeOrderMsg,
              ),
            );
          } else if (state is AddOrderFailure) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: ProviderDetailsViewBody(
                      data: widget.data.data,
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Tabbar(
                  views: [
                    const ProviderExhibitsController(),
                    MakeOrderWidget(
                      data: widget.data.data,
                      orderType: AppStrings.private,
                    ),
                  ],
                  tabs: [
                    Tab(height: 65, child: Text(S.of(context).exhibits)),
                    Tab(height: 65, child: Text(S.of(context).makeARequest)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
