import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/home_client/presentation/widgets/day_working_hours.dart';
import 'package:car_help/features/home_client/presentation/widgets/times_loading_widget.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:car_help/features/orders/presentation/manager/provider%20times%20cubit/provider_times_cubit.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'daily_working_hours_widget.dart';

class ProviderTimesController extends StatefulWidget {
  final int? providerId;
  final String? orderDate;
  final void Function(String?)? onTap;
  const ProviderTimesController({
    super.key,
    this.providerId,
    this.orderDate,
    this.onTap,
  });

  @override
  State<ProviderTimesController> createState() =>
      _ProviderTimesControllerState();
}

class _ProviderTimesControllerState extends State<ProviderTimesController> {
  @override
  void initState() {
    BlocProvider.of<ProviderTimesCubit>(context).getProviderTimes(
      providerId: widget.providerId,
      orderDate: widget.orderDate,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderTimesCubit, ProviderTimesState>(
      builder: (context, state) {
        if (state is ProviderTimesLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is ProviderTimesFailure) {
          return FailuresWidget(
            errorMessage: state.errorMessage,
            viewIcon: false,
          );
        } else if (state is ProviderTimesSuccess) {
          if (state.data.isEmpty) {
            return Text(S.of(context).noTimesAvailable);
          }
          return DailyWorkingHoursWidget(
            data: state.data,
            onTap: widget.onTap,
          );
        }

        return const Center(
          child: Text('Somthing Was Rong'),
        );
      },
    );
  }
}
