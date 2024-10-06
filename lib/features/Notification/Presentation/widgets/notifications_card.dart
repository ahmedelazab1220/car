import 'package:car_help/config/helper/helper.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/Notification/domain/entites/notification_entity.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final List<NotificationGroup> notifications;

  const NotificationCard({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(notifications[index].date,
                  style: AppStyles.textStyle12_400Grey),
            ),
            ListView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: notifications[index].notifications.length,
              itemBuilder: (context, innerIndex) {
                return CustomCard(
                  title: notifications[index].notifications[innerIndex].titleE!,
                  subTitle: notifications[index]
                      .notifications[innerIndex]
                      .descriptionE!,
                  date: formatDateTime(
                    notifications[index]
                        .notifications[innerIndex]
                        .createdAtE!
                        .toString(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String date;
  const CustomCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // SvgPicture.asset(
            //   AppAssets.smallLogo,
            //   height: 40,
            //   width: 40,
            // ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.74,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: AppStyles.textStyle12_600,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                        date,
                        style: AppStyles.textStyle12_700Grey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    subTitle,
                    style: AppStyles.textStyle12_400Grey,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
