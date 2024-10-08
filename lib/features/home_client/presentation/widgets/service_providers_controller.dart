import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/manager/home%20client%20cubit/home_client_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/loading_list_view.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_providers_list_view.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceProvidersController extends StatefulWidget {
  const ServiceProvidersController({
    super.key,
  });

  @override
  State<ServiceProvidersController> createState() =>
      _ServiceProvidersControllerState();
}

class _ServiceProvidersControllerState
    extends State<ServiceProvidersController> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeClientCubit, HomeClientState>(
      builder: (context, state) {
        if (state is HomeClientLoading) {
          return const LoadingListView();
        } else if (state is HomeClientFailure) {
          return FailuresWidget(
            errorMessage: state.errorMessage,
            viewIcon: false,
          );
        } else if (state is HomeClientSuccess) {
          if (state.providers!.isEmpty) {
            return const SizedBox(
              height: 167,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  'لا توجد مقدمي خدمات بالقرب منك',
                  style: AppStyles.textStyle16_700Grey,
                ),
              ),
            );
          }
          return ServiceProvidersListView(
            providers: state.providers!,
          );
        }
        return const Center(
          child: Text('Somthing Was Rong'),
        );
      },
    );
  }
}
