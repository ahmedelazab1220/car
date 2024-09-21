import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/settings/data/repos/settings_repo_impl.dart';
import 'package:car_help/features/settings/presentation/manager/faq%20cubit/faq_cubit.dart';
import 'package:car_help/features/settings/presentation/widgets/faq_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FAQViewBloc extends StatefulWidget {
  const FAQViewBloc({super.key});

  @override
  State<FAQViewBloc> createState() => _FAQViewBlocState();
}

class _FAQViewBlocState extends State<FAQViewBloc> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FaqCubit(
              getIt.get<SettingsRepoImpl>(),
            )..getFAQ(),
        child: BlocBuilder<FaqCubit, FaqState>(
          builder: (context, state) {
            if (state is FaqLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FaqFAilure) {
              // return FailuresWidget(errorMessage: state.errorMessage);
            } else if (state is FaqSuccess) {
              return FAQViewBody(data: state.data);
            }
            return const Center(
              child: Text('Somthing is Rong'),
            );
          },
        ));
  }
}
