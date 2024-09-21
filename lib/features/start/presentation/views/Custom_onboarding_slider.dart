import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/start/presentation/views/on_boarding_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomOnboardingSlider extends StatefulWidget {
  final double height;
  const CustomOnboardingSlider({super.key, required this.height});

  @override
  State<CustomOnboardingSlider> createState() => _CustomOnboardingSliderState();
}

class _CustomOnboardingSliderState extends State<CustomOnboardingSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  List<Widget> imgList = [
    Image.asset(AppAssets.boarding1),
    Image.asset(AppAssets.boarding2),
    Image.asset(AppAssets.boarding3),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> textImage = [
      OnBoardingWidget(
        title: S.of(context).onBoarding1,
      ),
      OnBoardingWidget(
        title: S.of(context).onBoarding2,
      ),
      OnBoardingWidget(
        title: S.of(context).onBoarding3,
      ),
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kStartView);
                },
                child: Text(
                  S.of(context).skip,
                  style: AppStyles.textStyle14_700Black.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        CarouselSlider(
          items: imgList,
          carouselController: _controller,
          options: CarouselOptions(
            height: widget.height,
            enlargeCenterPage: true,
            aspectRatio: 5.0,
            viewportFraction: 0.95,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8,
                height: 8,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? AppColors.grey
                          : AppColors.primary)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
        textImage[_current],
        const Spacer(),
        InkWell(
          onTap: () {
            int nextIndex = (_current + 1) % imgList.length;
            if (_current == imgList.length - 1) {
              GoRouter.of(context).push(AppRouter.kStartView);
            }
            _controller.animateToPage(nextIndex);
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30)),
            child: SvgPicture.asset(
              AppAssets.arrowLeft,
              height: SizeConfig.bodyHeight * .06,
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.bodyHeight * .04,
        )
      ],
    );
  }
}
