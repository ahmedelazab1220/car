import 'package:car_help/features/settings/presentation/widgets/technical_support_view_bloc.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class TechnicalSupportView extends StatelessWidget {
  const TechnicalSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).contactUs),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              TechnicalSupportViewBloc(),
            ],
          ),
        ),
      ),
    );
  }
}
