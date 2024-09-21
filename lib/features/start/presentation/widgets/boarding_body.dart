// import 'package:car_help/core/utils/app_assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import 'splash_content.dart';

// class Body extends StatelessWidget {
//   const Body({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<StartCubit, StartState>(
//       listener: (context, state) {},
//       builder: (context, states) {
//         return Column(
//           children: <Widget>[
//             Expanded(
//               flex: 7,
//               child: PageView.builder(
//                 onPageChanged: (index) {
//                   if (index == SplashHelper().splashData(context).length - 1) {
//                     cubit.changePageViewState(true);
//                   } else {
//                     cubit.changePageViewState(false);
//                   }
//                 },
//                 itemCount: SplashHelper().splashData(context).length,
//                 physics: const BouncingScrollPhysics(),
//                 controller: cubit.boardController,
//                 itemBuilder: (context, index) => SplashContent(
//                   image: SplashHelper().splashData(context)[index]["image"].toString(),
//                   text: SplashHelper().splashData(context)[index]['text'].toString(),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Column(
//                 children: <Widget>[
//                   SmoothPageIndicator(
//                     controller: cubit.boardController,
//                     count: SplashHelper().splashData(context).length,
//                     effect: WormEffect(
//                       dotColor: AppColors.grey,
//                       activeDotColor: AppColors.primary,
//                       dotHeight: 10,
//                       dotWidth: 10,
//                       spacing: 5.0,
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.bodyHeight*.04 ,),
//                   InkWell(
//                     onTap: () {
//                       if (cubit.isLast) {
//                         cubit.submit(isGuest: false);
//                       } else {
//                         cubit.boardController.nextPage(
//                             duration: const Duration(
//                               milliseconds: 750,
//                             ),
//                             curve: Curves.fastLinearToSlowEaseIn);
//                       }
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(15),
//                         decoration: BoxDecoration(
//                         color: AppColors.primary,
//                           borderRadius: BorderRadius.circular(30)
//                       ),
//                       child: SvgPicture.asset(AppAssets.arrowLeft,height: SizeConfig.bodyHeight*.06,),
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.bodyHeight*.04 ,),

//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
