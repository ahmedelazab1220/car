import 'package:car_help/features/home_client/presentation/widgets/provider_times_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyWorkingHoursWidget extends StatelessWidget {
  final int providerId;
  const DailyWorkingHoursWidget({
    super.key,
    required this.providerId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) {
          return ProviderTimesController(
            providerId: providerId,
            orderDate: DateFormat('yyyy-MM-dd', 'en').format(
              DateTime.now().add(
                Duration(days: index),
              ),
            ),
          );
        });
  }
}
