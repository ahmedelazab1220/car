import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/make_order_widget.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_details_exhibits_list_view.dart';
import 'package:car_help/features/widgets/tabbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../widgets/provider_details_view_body.dart';

class ProviderDetailsView extends StatelessWidget {
  final ProviderEntity data;
  const ProviderDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: ProviderDetailsViewBody(
                data: data,
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Tabbar(
            views: const [
              ServiceDetailsExhibitsListView(),
              MakeOrderWidget(),
            ],
            tabs: [
              Tab(height: 65, child: Text(S.of(context).exhibits)),
              Tab(height: 65, child: Text(S.of(context).makeARequest)),
            ],
          ),
        ),
      ),
    );
  }
}
