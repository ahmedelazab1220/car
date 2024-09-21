import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/layout/presentation/widgets/custom_nav_bar.dart';
import 'package:car_help/features/profile/Presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:car_help/features/settings/presentation/views/settings_view.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ProviderLayout extends StatefulWidget {
  const ProviderLayout({
    super.key,
  });

  @override
  State<ProviderLayout> createState() => _ProviderLayoutState();
}

class _ProviderLayoutState extends State<ProviderLayout> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfileData(remote: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PersistentBottomNavBarItem itemStyle(
      Widget icon,
      String title,
    ) {
      return PersistentBottomNavBarItem(
        icon: icon,
        activeColorPrimary: AppColors.primary,
        activeColorSecondary: AppColors.primaryDark,
        title: (title),
        textStyle: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    }


    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        itemStyle(SvgPicture.asset(AppAssets.home), S.of(context).home),
        itemStyle(
            SvgPicture.asset(AppAssets.myServices), S.of(context).myServices),
        itemStyle(SvgPicture.asset(AppAssets.exhibits), S.of(context).exhibits),
        itemStyle(SvgPicture.asset(AppAssets.profile), S.of(context).more),
      ];
    }

    return CustomNavBar(
      items: _navBarsItems(),
      screens: const [
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SettingsView(
          userType: AppStrings.provider,
        )
        // const HomeView(),
        // const ProductsView(),
        // SizedBox(
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         CustomButton(
        //           width: 200,
        //           title: S.of(context).login,
        //           onPressed: () => GoRouter.of(context).push(
        //             AppRouter.kLoginView,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // const SettingsView(
        //   userType: AppStrings.both,
        // ),
      ],
    );
  }
}
