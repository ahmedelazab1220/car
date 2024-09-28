import 'package:car_help/core/utils/app_constant.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/presentation/widgets/exhibits_card.dart';
import 'package:car_help/features/home_client/presentation/views/provider_details_view.dart';
import 'package:flutter/material.dart';

class ExhibitsListView extends StatelessWidget {
  final List<ExhibitsEntity> data;
  const ExhibitsListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ListView.builder(
          itemCount: data.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ExhibitsCard(
                  onTap: () {}, data: data[index],
                  // AppConstant.navigateTo(
                  //   context,
                  //   const ServiceDetailsView(),
                  // ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
