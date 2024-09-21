import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/home_client/presentation/pages/client_home_view.dart';
import 'package:car_help/features/layout/presentation/widgets/custom_nav_bar.dart';
import 'package:car_help/features/profile/Presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:car_help/features/settings/presentation/views/settings_view.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class ClientLayout extends StatefulWidget {
  const ClientLayout({super.key});

  @override
  State<ClientLayout> createState() => _ClientLayoutState();
}

class _ClientLayoutState extends State<ClientLayout> {
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
          fontFamily: AppStrings.arabicFont,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
    }


        List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        itemStyle(SvgPicture.asset(AppAssets.home), S.of(context).home),
        itemStyle(SvgPicture.asset(AppAssets.orders), S.of(context).orders),
        itemStyle(SvgPicture.asset(AppAssets.cars), S.of(context).cars),
        itemStyle(SvgPicture.asset(AppAssets.profile), S.of(context).more),
      ];
    }

    return CustomNavBar(
      items: _navBarsItems(),
      screens: const [
        ClientHomeView(),
        SizedBox(),
        SizedBox(),
        SettingsView(
          userType: AppStrings.client,
        )

        // HomeView(
        //   userType: AppStrings.client,
        // ),
        // ProductsView(),
        // RemindersView(),
        // SettingsView(
        //   userType: AppStrings.client,
        // ),
      ],
    );
  }
}
