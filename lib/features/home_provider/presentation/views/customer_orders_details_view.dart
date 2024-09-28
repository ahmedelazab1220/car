import 'package:car_help/features/home_provider/presentation/widgets/customer_orders_details_view_body.dart';
import 'package:car_help/features/home_provider/presentation/widgets/direct_price_widget.dart';
import 'package:car_help/features/home_provider/presentation/widgets/price_submission_widget.dart';
import 'package:car_help/features/home_provider/presentation/widgets/visit_for_inspection_widget.dart';
import 'package:car_help/features/widgets/tabbar.dart';
import 'package:car_help/generated/l10n.dart';

import 'package:flutter/material.dart';

class CustomerOrdersDetailsView extends StatelessWidget {
  const CustomerOrdersDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: context.localizations.orderDetails,
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(
              child: CustomerOrdersDetailsViewBody(),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Tabbar(
            views: const [
              DirectPriceWidget(),
              PriceSubmissionWidget(),
              VisitForInspectionWidget(),
            ],
            tabs: [
              Tab(height: 65, child: Text(S.of(context).directPrice)),
              Tab(height: 65, child: Text(S.of(context).priceSubmission)),
              Tab(height: 65, child: Text(S.of(context).visitForInspection)),
            ],
          ),
        ),
      ),
    );
  }
}
