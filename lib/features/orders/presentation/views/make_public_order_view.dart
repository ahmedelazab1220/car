import 'package:car_help/features/orders/presentation/widgets/make_public_order_view_controller.dart';
import 'package:car_help/features/widgets/custom_app_bar%20copy.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class MakePublicOrder extends StatelessWidget {
  const MakePublicOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).makeARequest),
      body: const MakePublicOrderViewController(),
    );
  }
}
