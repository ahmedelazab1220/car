import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/home_client/presentation/home_helper.dart';
import 'package:car_help/features/home_client/presentation/widgets/make_an_order_bottom_sheet_body.dart';

import 'package:car_help/features/home_provider/domain/repos/home_provider_repo.dart';
import 'package:car_help/features/home_provider/presentation/manager/send%20offer%20cubit/send_offer_cubit.dart';
import 'package:car_help/features/home_provider/presentation/widgets/customer_orders_details_view_body.dart';
import 'package:car_help/features/home_provider/presentation/widgets/direct_price_widget.dart';
import 'package:car_help/features/home_provider/presentation/widgets/price_submission_widget.dart';
import 'package:car_help/features/home_provider/presentation/widgets/visit_for_inspection_widget.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/features/widgets/tabbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomerOrderDetailsViewController extends StatefulWidget {
  const CustomerOrderDetailsViewController({
    super.key,
    required this.data,
  });

  final OrderEntity data;

  @override
  State<CustomerOrderDetailsViewController> createState() =>
      _CustomerOrderDetailsViewControllerState();
}

class _CustomerOrderDetailsViewControllerState
    extends State<CustomerOrderDetailsViewController> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendOfferCubit(getIt.get<HomeProviderRepo>()),
      child: BlocConsumer<SendOfferCubit, SendOfferState>(
        listener: (context, state) {
          if (state is SendOfferLoading) {
            isLoading = true;
          } else if (state is SendOfferSuccess) {
            isLoading = false;
            HomeHelper.showBottomSheetDialog(
              context: context,
              widget: MakeAnOrderBottomSheetBody(
                title: S.of(context).successfullySendOffer,
              ),
            );
          } else if (state is SendOfferFailure) {
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
                    child: CustomerOrdersDetailsViewBody(
                      data: widget.data,
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Tabbar(
                  views: [
                    DirectPriceWidget(data: widget.data),
                    PriceSubmissionWidget(data: widget.data),
                    VisitForInspectionWidget(data: widget.data),
                  ],
                  tabs: [
                    Tab(
                        height: 65,
                        child: Text(
                          S.of(context).directPrice,
                          textAlign: TextAlign.center,
                        )),
                    Tab(
                        height: 65,
                        child: Text(
                          S.of(context).priceSubmission,
                          textAlign: TextAlign.center,
                        )),
                    Tab(
                        height: 65,
                        child: Text(
                          S.of(context).visitForInspection,
                          textAlign: TextAlign.center,
                        )),
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
