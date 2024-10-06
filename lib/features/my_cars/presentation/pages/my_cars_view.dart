import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/my_cars/presentation/widgets/mycars_view_controller.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyCarsView extends StatelessWidget {
  const MyCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    S.of(context).cars,
                    style: AppStyles.textStyle18_900,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: MyCarsViewController(),
            ),
          ],
        ),
      ),
    );
  }
}
