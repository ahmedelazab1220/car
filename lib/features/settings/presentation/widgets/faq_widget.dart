import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/settings/domain/entites/faq_entity.dart';
import 'package:flutter/material.dart';

class FaqWidget extends StatefulWidget {
  final FaqEntity? data;

  const FaqWidget({
    super.key,
    this.data,
  });

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 1),
            color: AppColors.grey.withOpacity(0.1),
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.data?.title ?? '',
                  style: AppStyles.textStyle13_600,
                ),
                const Spacer(),
                isExpanded
                    ? const Icon(Icons.expand_less)
                    : Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.primaryYellow,
                        size: 16,
                      ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              widget.data?.answer ?? '',
              style: AppStyles.textStyle12_700Grey,
            ),
          ),
      ],
    );
  }
}
