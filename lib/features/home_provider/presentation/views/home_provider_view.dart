import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/home_provider/domain/repos/home_provider_repo.dart';
import 'package:car_help/features/home_provider/presentation/manager/home%20provider%20cubit/home_provider_cubit.dart';
import 'package:car_help/features/home_provider/presentation/widgets/home_provider_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProviderView extends StatelessWidget {
  const HomeProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => HomeProviderCubit(
                      getIt.get<HomeProviderRepo>(),
                    )..getHomeProvider())
          ],
          child: const HomeProviderViewBody(),
        ),
      ),
    );
  }
}
