import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/Notification/Presentation/manger/notifications%20cubit/notifications_cubit.dart';
import 'package:car_help/features/Notification/Presentation/widgets/notifications_bloc.dart';
import 'package:car_help/features/layout/presentation/widgets/login_both_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationView extends StatefulWidget {
  final String? userType;
  const NotificationView({super.key, this.userType});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    if (widget.userType != AppStrings.both) {
      BlocProvider.of<NotificationsCubit>(context).markAllAsRead();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notifications),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomBackAppbar(title: S.of(context).notification),
              if (widget.userType != AppStrings.both)
                const Expanded(
                  child: NotificationsBloc(),
                )
              else
                const Expanded(
                  child: LoginBothWidget(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
