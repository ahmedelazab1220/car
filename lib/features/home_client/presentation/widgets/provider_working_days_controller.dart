import 'package:car_help/features/home_client/presentation/manager/provider%20cubit/provider_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/day_working_hours.dart';
import 'package:car_help/features/home_client/presentation/widgets/times_loading_widget.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderWorkingDaysController extends StatefulWidget {
  const ProviderWorkingDaysController({
    super.key,
  });

  @override
  State<ProviderWorkingDaysController> createState() =>
      _ProviderWorkingDaysControllerState();
}

class _ProviderWorkingDaysControllerState
    extends State<ProviderWorkingDaysController> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderCubit, ProviderState>(
      builder: (context, state) {
        if (state is ProviderLoading) {
          return const Column(
            children: [
              TimesLoadingWidget(),
              TimesLoadingWidget(),
              TimesLoadingWidget(),
              TimesLoadingWidget(),
              TimesLoadingWidget(),
              TimesLoadingWidget(),
              TimesLoadingWidget(),
            ],
          );
        } else if (state is ProviderFailure) {
          return FailuresWidget(
            errorMessage: state.errorMessage,
            viewIcon: false,
          );
        } else if (state is ProviderSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data.workingDays?.length,
              itemBuilder: (context, index) {
                return DayWorkingHours(
                  dayName: state.data.workingDays?[index].day ?? '',
                  startHour: state.data.workingDays?[index].from ?? '',
                  endHour: state.data.workingDays?[index].to ?? '',
                  isAvilable: state.data.workingDays?[index].isHoliday == 1
                      ? false
                      : true,
                );
              });
        }
        return const Center(
          child: Text('Somthing Was Rong'),
        );
      },
    );
  }
}
