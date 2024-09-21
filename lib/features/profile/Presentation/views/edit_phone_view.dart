import 'package:car_help/features/profile/Presentation/widgets/edit_phone_view_bloc.dart';
import 'package:flutter/material.dart';

class EditPhoneView extends StatelessWidget {
  final List phone;
  const EditPhoneView({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: EditPhoneViewBloc(
        phone: phone,
      )),
    );
  }
}
