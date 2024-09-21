import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/profile/Presentation/widgets/edit_profile_view_bloc.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  final UserEntity data;

  const EditProfileView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).editProfile)),
      body: SafeArea(
        child: EditProfileViewBloc(
          data: data,
        ),
      ),
    );
  }
}
