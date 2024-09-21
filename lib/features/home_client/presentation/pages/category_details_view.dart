import 'package:car_help/features/home_client/presentation/widgets/category_details_view_body.dart';
import 'package:flutter/material.dart';

class CategoryDetailsView extends StatelessWidget {
  final String category;
  const CategoryDetailsView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return CategoryDetailsViewBody(
      title: category,
    );
  }
}
