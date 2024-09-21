import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/category_details_view_body.dart';
import 'package:flutter/material.dart';

class CategoryDetailsView extends StatelessWidget {
  final ServiceEntity data;
  const CategoryDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CategoryDetailsViewBody(
      data: data,
    );
  }
}
