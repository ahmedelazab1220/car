import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/settings/presentation/manager/info%20cubit/info_cubit.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoViewBloc extends StatefulWidget {
  final int? type;
  const InfoViewBloc({
    super.key,
    this.type,
  });

  @override
  State<InfoViewBloc> createState() => _InfoViewBlocState();
}

class _InfoViewBlocState extends State<InfoViewBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoCubit, InfoState>(
      builder: (context, state) {
        if (state is InfoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is InfoFailure) {
          return FailuresWidget(errorMessage: state.errorMessage);
        } else if (state is InfoSoccess) {
          var data = widget.type == 0
              ? state.aboutUsData
              : widget.type == 1
                  ? state.privacyPolicyData
                  : state.termsAndConditionsData;
          return Text(
            data!.descriptionE ?? '',
            style: AppStyles.textStyle14_400,
          );
        }
        return const Center(
          child: Text('Somthing is Rong'),
        );
      },
    );
  }
}
