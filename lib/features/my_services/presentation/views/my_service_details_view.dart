import 'package:car_help/features/my_services/presentation/widgets/my_service_details_view_body.dart';
import 'package:flutter/material.dart';

class MyServiceDetailsView extends StatelessWidget {
  final int requestStatusIndex;

  const MyServiceDetailsView({super.key, required this.requestStatusIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: context.localizations.orderDetails,
      // ),
      body: MyServiceDetailsViewBody(
        requestStatusIndex: requestStatusIndex,
      ),
    );
  }
}
