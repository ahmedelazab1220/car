import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/loading_list_view.dart';
import 'package:car_help/features/home_provider/presentation/manager/home%20provider%20cubit/home_provider_cubit.dart';
import 'package:car_help/features/home_provider/presentation/widgets/customer_orders_list_view.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerOrdersController extends StatefulWidget {
  const CustomerOrdersController({
    super.key,
  });

  @override
  State<CustomerOrdersController> createState() =>
      _CustomerOrdersControllerState();
}

class _CustomerOrdersControllerState extends State<CustomerOrdersController> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProviderCubit, HomeProviderState>(
      builder: (context, state) {
        if (state is HomeProviderLoading) {
          return const LoadingListView();
        } else if (state is HomeProviderFailure) {
          return FailuresWidget(
            errorMessage: state.errorMessage,
            viewIcon: false,
          );
        } else if (state is HomeProviderSuccess) {
          if (state.data.exhibts?.isEmpty ?? true) {
            return SizedBox(
              height: 167,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  S.of(context).noRequestes,
                  style: AppStyles.textStyle16_700Grey,
                ),
              ),
            );
          }
          return CustomerOrdersListView(
            data: state.data.exhibts!,
          );
        }
        return const Center(
          child: Text('Somthing Was Rong'),
        );
      },
    );
  }
}
