import 'package:car_help/features/start/presentation/widgets/start_view_body.dart';
import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: StartViewBody(),
      ),
    );
  }
}
