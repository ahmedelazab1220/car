import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/Notification/Presentation/manger/notifications%20cubit/notifications_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:badges/badges.dart' as badges;

class CustomButtonNotification extends StatefulWidget {
  final String? accountType;
  const CustomButtonNotification({super.key, this.accountType});

  @override
  State<CustomButtonNotification> createState() =>
      _CustomButtonNotificationState();
}

class _CustomButtonNotificationState extends State<CustomButtonNotification> {
  int count = 0;
  @override
  void initState() {
    if (widget.accountType != AppStrings.both) {
      BlocProvider.of<NotificationsCubit>(context).getNotifications();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsCubit, NotificationsState>(
      listener: (context, state) {
        if (state is NotificationsCount) {
          setState(() {
            count = state.count;
          });
        }
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            GoRouter.of(context)
                .push(AppRouter.kNotificationView, extra: widget.accountType);
            setState(() {
              count = 0;
            });
          },
          icon: badges.Badge(
            position: badges.BadgePosition.topEnd(end: 2, top: -2),
            showBadge: count != 0,
            badgeContent: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryYellow,
                shape: BoxShape.circle,
              ),
            ),
            child: SvgPicture.asset(AppAssets.notifications),
            // child: Icon(
            //   Iconsax.notification5,
            //   color: AppColors.black,
            //   size: 25,
            // ),
          ),
        );
      },
    );
  }
}
