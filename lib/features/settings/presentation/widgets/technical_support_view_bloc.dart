import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/settings/data/repos/settings_repo_impl.dart';
import 'package:car_help/features/settings/presentation/manager/contact%20information%20cubit/contact_information_cubit.dart';
import 'package:car_help/features/settings/presentation/widgets/technical_support_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechnicalSupportViewBloc extends StatefulWidget {
  const TechnicalSupportViewBloc({
    super.key,
  });

  @override
  State<TechnicalSupportViewBloc> createState() =>
      _TechnicalSupportViewBlocState();
}

class _TechnicalSupportViewBlocState extends State<TechnicalSupportViewBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactInformationCubit(
        getIt.get<SettingsRepoImpl>(),
      )..getContactInformation(),
      child: BlocBuilder<ContactInformationCubit, ContactInformationState>(
        builder: (context, state) {
          if (state is ContactInformationLoading) {
            return const TechnicalSupportViewBody();
          } else if (state is ContactInformationFailure) {
            return const TechnicalSupportViewBody();
          } else if (state is ContactInformationSuccess) {
            return TechnicalSupportViewBody(
              data: state.data,
            );
          }
          return const Center(
            child: Text('Somthing is Rong'),
          );
        },
      ),
    );
  }
}
