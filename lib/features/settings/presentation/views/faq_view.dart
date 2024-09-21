import 'package:car_help/features/settings/presentation/widgets/faq_view_bloc.dart';
import 'package:flutter/material.dart';

class FAQView extends StatefulWidget {
  const FAQView({
    super.key,
  });

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: FAQViewBloc(),
            ),
          ],
        ),
      ),
    );
  }
}
