import 'package:car_help/features/settings/presentation/widgets/contact_us_view_bloc.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).contactUs),
      ),
      body: const SafeArea(child: ContactUsViewBloc()),
    );
  }
}
