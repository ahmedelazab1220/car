import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/exhibits/domain/repos/exhibits_repo.dart';
import 'package:car_help/features/exhibits/presentation/manager/exhibits%20cubit/exhibits_cubit.dart';
import 'package:car_help/features/exhibits/presentation/widgets/exhibits_view_controller.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
