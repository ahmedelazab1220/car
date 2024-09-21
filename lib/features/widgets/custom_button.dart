import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color? color, titleColor, borderColor;
  final List<Color>? colors;
  final Widget widget;
  final double height, width, titleSize, radius;
  final EdgeInsetsGeometry? margin;
  final bool isWidthInfinity;
  final bool isLoading;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.color,
    this.titleColor = Colors.black,
    this.widget = const SizedBox(),
    this.height = 56,
    this.width = double.infinity,
    this.colors,
    this.margin,
    this.borderColor,
    this.titleSize = 16,
    this.isWidthInfinity = true,
    this.isLoading = false,
    this.radius = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          margin ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: color ?? AppColors.primary,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      width: isWidthInfinity ? width : null,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppStrings.englishFont,
                      fontSize: titleSize,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.fade,
                      color: titleColor,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
            const SizedBox(
              width: 2,
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
