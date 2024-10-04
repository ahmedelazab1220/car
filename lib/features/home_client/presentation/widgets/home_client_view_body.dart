import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:car_help/features/home_client/presentation/manager/services%20cubit/services_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/banner_controller.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_providers_controller.dart';
import 'package:car_help/features/home_client/presentation/widgets/services_view_controller.dart';
import 'package:car_help/features/widgets/custom_home_appbar.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home client cubit/home_client_cubit.dart';

class HomeClientViewBody extends StatefulWidget {
  const HomeClientViewBody({super.key});

  @override
  State<HomeClientViewBody> createState() => _HomeClientViewBodyState();
}

class _HomeClientViewBodyState extends State<HomeClientViewBody> {
  String? lat, lng, address;
  @override
  void initState() {
    BlocProvider.of<HomeClientCubit>(context).getHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HomeClientCubit>(context).getHome(lat: lat, lng: lng);
        ServicesCubit(getIt.get<HomeClientRepo>()).getServices(remote: true);
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHomeAppBar(
                title: S.of(context).welcomeDearCustomer,
                userType: AppStrings.client,
                latLng: (latitute, longitute, addressString) {
                  setState(() {
                    lat = latitute;
                    lng = longitute;
                    address = addressString;
                  });
                },
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
