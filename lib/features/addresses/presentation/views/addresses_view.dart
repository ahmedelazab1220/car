import 'package:car_help/features/addresses/presentation/widgets/addresses_view_controller.dart';
import 'package:car_help/features/widgets/custom_app_bar%20copy.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).myAddresses),
      body: const SafeArea(child: AddressesViewController()),
    );
  }
}
