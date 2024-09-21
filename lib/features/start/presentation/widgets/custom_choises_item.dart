import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:car_help/core/utils/app_colors.dart';

class CustomChoicesItemWidget extends StatelessWidget {
  final int value;
  final int groupValue;
  final String text;
  final void Function(int) onChanged;

  const CustomChoicesItemWidget(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.text,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    bool selected = (value == groupValue);
    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Container(
            height: SizeConfig.bodyHeight * .035,
            width: SizeConfig.screenWidth * .07,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? AppColors.primary : Colors.white,
                border: Border.all(color: AppColors.primary)),
            child: selected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  )
                : const Center(),
          ),
          SizedBox(width: SizeConfig.screenWidth * .02),
          Expanded(
            child: AppText(
              text: text,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              maxLines: 2,
              textSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
