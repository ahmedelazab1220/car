import 'package:car_help/features/home_client/presentation/widgets/home_client_view_body.dart';
import 'package:flutter/material.dart';

class HomeClientView extends StatelessWidget {
  const HomeClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeClientViewBody()),
    );
  }
}
