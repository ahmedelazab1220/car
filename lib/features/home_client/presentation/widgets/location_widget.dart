import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.city,
    required this.governorateUnit,
  });
  final String governorateUnit, city;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Ionicons.location_sharp,
            size: 16,
            color: AppColors.darkGrey,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            ' $city - $governorateUnit',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppStyles.textStyle10_800,
          ),
        ],
      ),
    );
  }
}
