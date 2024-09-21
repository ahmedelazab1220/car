import 'package:car_help/features/home_client/presentation/widgets/service_details_exhibits_card.dart';
import 'package:flutter/material.dart';

class ServiceDetailsExhibitsListView extends StatelessWidget {
  const ServiceDetailsExhibitsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const Column(
            children: [
              ServiceDetailsExhibitsCard(),
            ],
          );
        },
      ),
    );
  }
}
