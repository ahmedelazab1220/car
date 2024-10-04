import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/my_services/domain/repos/my_service_repo.dart';
import 'package:car_help/features/my_services/presentation/manager/my%20services%20cubit/my_services_cubit.dart';
import 'package:car_help/features/my_services/presentation/widgets/my_services_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyServicesView extends StatelessWidget {
  const MyServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyServicesCubit(getIt.get<MyServicesRepo>())..getMyService(),
      child: const Scaffold(
        body: SafeArea(
          child: MyServicesViewBody(),
        ),
      ),
    );
  }
}
