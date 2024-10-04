import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyWorkingHoursWidget extends StatefulWidget {
  final List<ProviderTimesEntity> data;
  final void Function(String?)? onTap;

  const DailyWorkingHoursWidget({
    super.key,
    required this.data,
    this.onTap,
  });

  @override
  State<DailyWorkingHoursWidget> createState() =>
      _DailyWorkingHoursWidgetState();
}

class _DailyWorkingHoursWidgetState extends State<DailyWorkingHoursWidget> {
  int? isSelectIndex;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        final providerTime = widget.data[index];
        DateTime parsedTime = DateFormat("HH:mm").parse(providerTime.from!);
        String time12 = DateFormat("hh:mm a").format(parsedTime);
        return InkWell(
          onTap: providerTime.isAvilable ?? true
              ? () {
                  setState(() {
                    isSelectIndex = index;
                  });
                  if (widget.onTap != null) {
                    widget.onTap!(providerTime.from);
                  }
                }
              : null,
          child: Container(
            decoration: BoxDecoration(
              color: providerTime.isAvilable ?? true
                  ? (isSelectIndex == index
                      ? AppColors.primary.withOpacity(0.5)
                      : Colors.transparent)
                  : AppColors.grey.withOpacity(0.2),
              border: Border.all(
                  color: (isSelectIndex == index
                      ? AppColors.primary
                      : AppColors.grey.withOpacity(0.4))),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                time12,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 2.5,
      ),
    );
  }
}
