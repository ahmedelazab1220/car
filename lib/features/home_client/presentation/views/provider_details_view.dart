import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:car_help/features/home_client/presentation/manager/provider%20cubit/provider_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/provider_details_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderDetailsView extends StatefulWidget {
  final ProviderEntity data;
  const ProviderDetailsView({super.key, required this.data});

  @override
  State<ProviderDetailsView> createState() => _ProviderDetailsViewState();
}

class _ProviderDetailsViewState extends State<ProviderDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProviderCubit(getIt.get<HomeClientRepo>())
        ..getProvider(providerId: widget.data.id ?? 0),
      child: Scaffold(
        body: ProviderDetailsViewController(data: widget),
      ),
    );
  }
}
