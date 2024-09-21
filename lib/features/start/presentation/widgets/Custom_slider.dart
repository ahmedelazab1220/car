import 'package:car_help/core/utils/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final List<Widget> imgList;
  final double height;
  const CustomSlider({super.key, required this.imgList, required this.height});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CarouselSlider(
        items: widget.imgList,
        carouselController: _controller,
        options: CarouselOptions(
            height: widget.height,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 5.0,
            viewportFraction: 0.95,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: _current == entry.key ? 8 : 6,
              height: _current == entry.key ? 8 : 6,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _current == entry.key
                      ? AppColors.primary
                      : AppColors.grey),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
