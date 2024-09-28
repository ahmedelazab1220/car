import 'package:car_help/features/my_services/presentation/widgets/my_services_view_body.dart';
import 'package:flutter/material.dart';

class MyServicesView extends StatelessWidget {
  const MyServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MyServicesViewBody(),
      ),
    );
  }
}
