// import 'package:car_help/features/home_provider/presentation/pages/provider_home_view.dart';
// import 'package:car_help/generated/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:car_help/core/utils/app_assets.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

// class ProviderBottomNavBar extends StatelessWidget {
//   const ProviderBottomNavBar({super.key});
//   PersistentBottomNavBarItem itemStyle(
//     Widget icon,
//     String title,
//   ) {
//     return PersistentBottomNavBarItem(
//       icon: icon,
//       activeColorPrimary: AppColors.primary,
//       activeColorSecondary: AppColors.primaryDark,
//       title: (title),
//       textStyle: const TextStyle(
//         fontFamily: 'Cairo',
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }

//   List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
//     return [
//       itemStyle(SvgPicture.asset(AppAssets.home), S.of(context).home),
//       itemStyle(SvgPicture.asset(AppAssets.myServices),
//           S.of(context).myServices),
//       itemStyle(
//           SvgPicture.asset(AppAssets.exhibits), context.localizations.exhibits),
//       itemStyle(
//           SvgPicture.asset(AppAssets.profile), context.localizations.more),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PersistentTabView(
//         hideNavigationBarWhenKeyboardAppears: true,
//         context,
//         screens: const [
//           ProviderHomeView(),
//           MyServicesView(),
//           ExhibitsView(),
//           MoreView(),
//         ],
//         // resizeToAvoidBottomInset: true,
//         items: _navBarsItems(context),
//         // decoration: NavBarDecoration(
//         //   useBackdropFilter: false,
//         //   // border: Border.all(color: Colors.grey.withOpacity(0.1), width: 3),
//         //   // borderRadius: const BorderRadius.only(
//         //   // topLeft: Radius.circular(25), topRight: Radius.circular(25)),
//         // ),
//         navBarStyle: NavBarStyle.style7,
//       ),
//     );
//   }
// }
