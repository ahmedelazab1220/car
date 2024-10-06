import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/presentation/widgets/add_exhibit_view_controller.dart';
import 'package:car_help/features/widgets/custom_app_bar%20copy.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddExhibitView extends StatelessWidget {
  final ExhibitsEntity? data;
  const AddExhibitView({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).addExhibit,
      ),
      body: SafeArea(
        child: AddExhibitViewController(
          data: data,
        ),
      ),
    );
  }
}
