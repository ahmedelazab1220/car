import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final String price;
  final String? discount;
  const PriceWidget({
    super.key,
    required this.price,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        children: [
          Text(
            '$price ${S.of(context).currency}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          if (discount != null)
            Text(
              '$discount ${S.of(context).currency}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.red,
                decoration: TextDecoration.lineThrough,
              ),
            ),
        ],
      ),
    );
  }
}
