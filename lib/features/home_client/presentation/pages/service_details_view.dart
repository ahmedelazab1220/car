import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/make_request_widget.dart';
import 'package:car_help/features/widgets/tabbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../widgets/service_details_view_body.dart';

class ServiceDetailsView extends StatelessWidget {
  final ProviderEntity data;
  const ServiceDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: ServiceDetailsViewBody(
                data: data,
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Tabbar(
            views: const [
              MakeRequestWidget(),
              MakeRequestWidget(),
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
