import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/auth/presentation/manager/logout%20cubit/logout_cubit.dart';
import 'package:car_help/features/profile/Presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:car_help/features/settings/presentation/widgets/settings_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatefulWidget {
  final String userType;
  const SettingsView({super.key, required this.userType});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LogoutCubit(
            getIt.get<AuthRepoImpl>(),
          ),
          child: SettingsVewBloc(
            userType: widget.userType,
          ),
        ),
      ),
    );
  }
}
