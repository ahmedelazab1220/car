import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/banner_controller.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_providers_controller.dart';
import 'package:car_help/features/home_client/presentation/widgets/services_view_controller.dart';
import 'package:car_help/features/widgets/custom_home_appbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home cubit/home_cubit.dart';

class ClientHomeViewBody extends StatefulWidget {
  const ClientHomeViewBody({super.key});

  @override
  State<ClientHomeViewBody> createState() => _ClientHomeViewBodyState();
}

class _ClientHomeViewBodyState extends State<ClientHomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHomeAppBar(
                title: 'أهلا بك عميلنا العزيز',
              ),
              const BannerController(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).services,
                  style: AppStyles.textStyle14_700Black,
                ),
              ),
              const ServicesViewController(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  S.of(context).serviceProvidersNearYou,
                  style: AppStyles.textStyle14_700Black,
                ),
              ),
              const ServiceProvidersController(),
            ],
          ),
        ),
      ),
    );
  }
}
