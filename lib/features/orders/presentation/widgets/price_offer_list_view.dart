import 'package:car_help/features/orders/presentation/widgets/price_offer_card.dart';
import 'package:flutter/material.dart';

class PriceOfferListView extends StatelessWidget {
  const PriceOfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const PriceOfferCard();
      },
    );
  }
}
