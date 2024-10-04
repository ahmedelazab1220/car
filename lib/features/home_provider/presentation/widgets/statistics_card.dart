import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:car_help/core/utils/app_colors.dart';

class StatisticsCard extends StatelessWidget {
  final String title;
  final String number;
  const StatisticsCard({super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: GestureDetector(
          onTap: () {},

          child: Card(
            color: Colors.white,
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.frame),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        align: TextAlign.center,
                        text: number,
                        color: AppColors.black,
                        textSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      AppText(
                        align: TextAlign.center,
                        text: title,
                        color: AppColors.black,
                        textSize: 12,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
