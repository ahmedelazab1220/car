import 'package:car_help/features/home_client/presentation/widgets/client_home_view_body.dart';
import 'package:flutter/material.dart';

class ClientHomeView extends StatelessWidget {
  const ClientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ClientHomeViewBody()),
    );
  }
}
