import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/home_client/data/repos/home_repo_impl.dart';
import 'package:car_help/features/home_client/domain/repos/home_repo.dart';
import 'package:car_help/features/home_client/presentation/manager/services%20cubit/services_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/services_home_loading_view.dart';
import 'package:car_help/features/home_client/presentation/widgets/static_categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesViewController extends StatefulWidget {
  final bool inHome;
  final String? reminderType;
  final int? index;
  const ServicesViewController({
    super.key,
    this.inHome = false,
    this.reminderType,
    this.index,
  });

  @override
  State<ServicesViewController> createState() => _ServicesViewControllerState();
}

class _ServicesViewControllerState extends State<ServicesViewController> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesCubit(getIt.get<HomeRepo>())..getServices(),
      child: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoading) {
            return const ServicesHomeLoadingView();
          } else if (state is ServicesFailure) {
            return const SizedBox();
          } else if (state is ServicesSuccess) {
            return StaticCategoriesList(
              data: state.data,
            );
          }
          return const ServicesHomeLoadingView();
        },
      ),
    );
  }
}
