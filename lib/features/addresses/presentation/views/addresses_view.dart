import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/features/addresses/presentation/widgets/add_address_bottom_sheet_body.dart';
import 'package:car_help/features/addresses/presentation/widgets/addresses_view_body.dart';
import 'package:car_help/features/addresses/presentation/widgets/addresses_view_controller.dart';
import 'package:car_help/features/my_cars/presentation/my_cars_helper.dart';
import 'package:car_help/features/settings/presentation/settings_helper.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myAddresses),
      ),
      body: const SafeArea(child: AddressesViewController()),
    );
  }
}
