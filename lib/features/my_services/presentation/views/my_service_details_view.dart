import 'package:car_help/features/my_services/presentation/widgets/my_service_details_view_body.dart';
import 'package:car_help/features/widgets/custom_app_bar%20copy.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyServiceDetailsView extends StatelessWidget {
  final List list;

  const MyServiceDetailsView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).orderDetails,
      ),
      body: MyServiceDetailsViewBody(
        orderStatus: list[0],
        data: list[1],
      ),
    );
  }
}
