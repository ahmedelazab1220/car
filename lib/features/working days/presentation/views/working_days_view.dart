import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:car_help/features/working%20days/presentation/manager/working%20days%20cubit/working_days_cubit.dart';
import 'package:car_help/features/working%20days/presentation/widgets/working_days_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkingDaysView extends StatelessWidget {
  const WorkingDaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorkingDaysCubit(getIt.get<ProfileRepoImpl>())..getWorkingTimes(),
      child: Scaffold(
        appBar: AppBar(),
        body: const WorkingDaysController(),
      ),
    );
  }
}
