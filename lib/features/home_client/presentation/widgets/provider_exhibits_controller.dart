import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/manager/provider%20cubit/provider_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/loading_list_view.dart';
import 'package:car_help/features/home_client/presentation/widgets/provider_details_exhibits.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderExhibitsController extends StatefulWidget {
  const ProviderExhibitsController({
    super.key,
  });

  @override
  State<ProviderExhibitsController> createState() =>
      _ProviderExhibitsControllerState();
}

class _ProviderExhibitsControllerState
    extends State<ProviderExhibitsController> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProviderCubit, ProviderState>(
      builder: (context, state) {
        if (state is ProviderLoading) {
          return const LoadingListView();
        } else if (state is ProviderFailure) {
          return FailuresWidget(
            errorMessage: state.errorMessage,
            viewIcon: false,
          );
        } else if (state is ProviderSuccess) {
          if (state.data.exhibits!.isEmpty) {
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
          return ProviderDetailsExhibits(
            data: state.data,
          );
        }
        return const Center(
          child: Text('Somthing Was Rong'),
        );
      },
    );
  }
}
