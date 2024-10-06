// ignore_for_file: must_be_immutable

import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/lists/presentation/controllers/cities_controller.dart';
import 'package:car_help/features/lists/presentation/controllers/districts_controller.dart';
import 'package:flutter/material.dart';

import 'package:car_help/core/utils/app_size.dart';

class AddressRegisterWidget extends StatefulWidget {
  String? city;
  String? distract;
  final void Function(int?) onSelectedCityId;
  final void Function(int?) onSelectedDistrictId;
  final UserEntity? data;
  AddressRegisterWidget({
    super.key,
    this.city,
    this.distract,
    required this.onSelectedCityId,
    required this.onSelectedDistrictId,
    this.data,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CitiesController(
              selectedId: widget.data?.city,
              onSelectedId: widget.onSelectedCityId),
        ),
        SizedBox(width: SizeConfig.screenWidth * .01),
        Expanded(
          child: DistrictsController(
              selectedId: widget.data?.district,
              onSelectedId: widget.onSelectedDistrictId),
        ),
      ],
    );
  }
}
