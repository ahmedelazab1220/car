import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:car_help/features/working%20days/presentation/manager/working%20days%20cubit/working_days_cubit.dart';
import 'package:car_help/features/working%20days/presentation/widgets/working_days_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkingDaysController extends StatefulWidget {
  const WorkingDaysController({
    super.key,
  });

  @override
  State<WorkingDaysController> createState() => _WorkingDaysControllerState();
}

class _WorkingDaysControllerState extends State<WorkingDaysController> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<WorkingDaysCubit>(context).getWorkingTimes();
      },
      child: BlocBuilder<WorkingDaysCubit, WorkingDaysState>(
          builder: (context, state) {
        if (state is WorkingDaysLoading) {
          return const LinearProgressIndicator();
        } else if (state is WorkingDaysSuccess) {
          if (state.data.isEmpty) {
            return const Expanded(
              child: Center(
                child: Text('No data'),
              ),
            );
          } else {
            return WorkingDaysViewBody(data: state.data);
          }
        } else if (state is WorkingDaysFailure) {
          return FailuresWidget(errorMessage: state.errorMessage);
        }

        return const CircularProgressIndicator();
      }),
    );
  }
}
