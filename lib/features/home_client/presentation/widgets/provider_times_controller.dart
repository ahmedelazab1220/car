import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/home_client/presentation/widgets/banner_loading_card.dart';
import 'package:car_help/features/home_client/presentation/widgets/day_working_hours.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
import 'package:car_help/features/orders/presentation/manager/provider%20times%20cubit/provider_times_cubit.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderTimesController extends StatefulWidget {
  final int? providerId;
  final String? orderDate;
  const ProviderTimesController({
    super.key,
    this.providerId,
    this.orderDate,
  });

  @override
  State<ProviderTimesController> createState() =>
      _ProviderTimesControllerState();
}

class _ProviderTimesControllerState extends State<ProviderTimesController> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderTimesCubit(getIt.get<OrdersRepo>())
        ..getProviderTimes(
            providerId: widget.providerId, orderDate: widget.orderDate),
      child: BlocBuilder<ProviderTimesCubit, ProviderTimesState>(
        builder: (context, state) {
          if (state is ProviderTimesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProviderTimesFailure) {
            return FailuresWidget(
              errorMessage: state.errorMessage,
              viewIcon: false,
            );
          } else if (state is ProviderTimesSuccess) {
            return DayWorkingHours(
              dayName: state.data.first.day ?? '',
              startHour: state.data.first.from ?? '',
              endHour: state.data.last.to ?? '',
            );
          }

          return const Center(
            child: Text('Somthing Was Rong'),
          );
        },
      ),
    );
  }
}
