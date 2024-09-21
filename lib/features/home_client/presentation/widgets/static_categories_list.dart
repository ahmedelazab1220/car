import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:flutter/material.dart';

import 'static_categories_card.dart';

class StaticCategoriesList extends StatefulWidget {
  final List<ServiceEntity> data;
  const StaticCategoriesList({super.key, required this.data});

  @override
  State<StaticCategoriesList> createState() => _StaticCategoriesListState();
}

class _StaticCategoriesListState extends State<StaticCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.2),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return StaticCategoriesCard(
            data: widget.data[index],
          );
        });
    // Column(
    //   children: [
    // Row(
    //   children: [
    //     StaticCategoriesItem(
    //       staticCategoriesEntity: staticsList[0],
    //       categoryName: context.localizations.generalMaintenance,
    //     ),
    //     StaticCategoriesItem(
    //         staticCategoriesEntity: staticsList[1],
    //         categoryName: context.localizations.mobileMaintenance),
    //     StaticCategoriesItem(
    //         staticCategoriesEntity: staticsList[2],
    //         categoryName: context.localizations.mobileWashing),
    //   ],
    // ),
    // Row(
    //   children: [
    //     StaticCategoriesItem(
    //         staticCategoriesEntity: staticsList[3],
    //         categoryName: context.localizations.protectionAndShading),
    //     StaticCategoriesItem(
    //         staticCategoriesEntity: staticsList[4],
    //         categoryName: context.localizations.mobileTires),
    //     StaticCategoriesItem(
    //         staticCategoriesEntity: staticsList[5],
    //         categoryName: context.localizations.adjustmentAndRepair),
    //   ],
    // )
    //   ],
    // );
  }
}
