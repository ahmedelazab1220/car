import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/exhibits/presentation/widgets/exhibits_view_controller.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class ExhibitsView extends StatelessWidget {
  const ExhibitsView({super.key});

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
                    S.of(context).exhibits,
                    style: AppStyles.textStyle18_900,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: ExhibitsViewController(),
            ),
          ],
        ),
      ),
    );
  }
}
