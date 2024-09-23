import 'package:car_help/features/Notification/Presentation/manger/notifications%20cubit/notifications_cubit.dart';
import 'package:car_help/features/Notification/Presentation/widgets/no_notifications.dart';
import 'package:car_help/features/Notification/Presentation/widgets/notifications_list_view.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsBloc extends StatefulWidget {
  final void Function(int?)? isReadedCount;
  const NotificationsBloc({
    super.key,
    this.isReadedCount,
  });

  @override
  State<NotificationsBloc> createState() => _NotificationsBlocState();
}

class _NotificationsBlocState extends State<NotificationsBloc> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NotificationsCubit>(context).getNotifications();
      },
      child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
        if (state is NotificationsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NotificationsFailure) {
          return FailuresWidget(
              errorMessage: state.errorMessage,
              onPressed: () {
                BlocProvider.of<NotificationsCubit>(context).getNotifications();
              });
        } else if (state is NotificationsSuccess) {
          if (state.notifications.isNotEmpty) {
            return NotificationsListView(
              notifications: state.notifications,
            );
          } else {
            return NoNotifications(
              onPressed: () {
                BlocProvider.of<NotificationsCubit>(context).getNotifications();
              },
            );
          }
        }

        return const Center(
          child: Text('Somthing was rong'),
        );
      }),
    );
  }
}
