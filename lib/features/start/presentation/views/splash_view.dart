import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/config/helper/cache_helper.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_size.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SizedBox(
          width: SizeConfig.screenWidth * 0.5,
          child: Image.asset(
            AppAssets.appLogo,
          ),
        ),
      ),
    );
  }

  void navigateToHome(BuildContext context) async {
    String? token = await CacheHelper().getToken();
    String? userType = await CacheHelper().getUserType();
    bool isFirstTime = await CacheHelper().isFirstTime() ?? true;
    await Future.delayed(const Duration(seconds: 4), () {
      // Ensure the context is still valid (widget is still mounted)
      if (!mounted) {
        return; // Prevents navigation if the widget is no longer active
      }

      if (token == null) {
        if (isFirstTime) {
          GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.kStartView);
        }
      } else if (userType == AppStrings.client) {
        GoRouter.of(context).pushReplacement(AppRouter.kClientLayout);
      } else if (userType == AppStrings.provider) {
        GoRouter.of(context).pushReplacement(AppRouter.kProviderLayout);
      } else {
        if (isFirstTime) {
          GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.kStartView);
        }
      }
    });
  }
}
