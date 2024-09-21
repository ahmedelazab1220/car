import 'package:car_help/features/lists/presentation/controllers/cities_controller.dart';
import 'package:car_help/features/lists/presentation/controllers/districts_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_size.dart';

class AddressRegisterWidget extends StatefulWidget {
  String? city;
  String? distract;
  final void Function(int?) onSelectedCityId;
  final void Function(int?) onSelectedDistrictId;
  AddressRegisterWidget({
    super.key,
    this.city,
    this.distract,
    required this.onSelectedCityId,
    required this.onSelectedDistrictId,
  });

  @override
  State<AddressRegisterWidget> createState() => _AddressRegisterWidgetState();
}

class _AddressRegisterWidgetState extends State<AddressRegisterWidget> {
  String city = '';
  String distract = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CitiesController(onSelectedId: widget.onSelectedCityId),
        ),
        SizedBox(width: SizeConfig.screenWidth * .01),
        Expanded(
          child: DistrictsController(onSelectedId: widget.onSelectedDistrictId),
        ),
      ],
    );
  }
}
