import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/settings/presentation/manager/info%20cubit/info_cubit.dart';
import 'package:car_help/features/settings/presentation/widgets/info_view_bloc.dart';
import 'package:car_help/features/widgets/custom_app_bar%20copy.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({
    super.key,
  });

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  void initState() {
    BlocProvider.of<InfoCubit>(context).getAboutUs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).aboutapp),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                          height: SizeConfig.screenWidth * 0.5,
                          child: Image.asset(AppAssets.appLogo)),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        S.of(context).aboutCarHelp,
                        style: AppStyles.textStyle14_700Black,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const InfoViewBloc(
                        type: 0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
