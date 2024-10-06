import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/profile/Presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class ToggleNotificationsButtons extends StatefulWidget {
  const ToggleNotificationsButtons({
    super.key,
  });

  @override
  State<ToggleNotificationsButtons> createState() =>
      _ToggleNotificationsButtonsState();
}

class _ToggleNotificationsButtonsState
    extends State<ToggleNotificationsButtons> {
  bool isSwichedNotification = false;
  bool isSwichedAdvertisement = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(listener: (context, state) {
      if (state is ProfileSuccess) {
        isSwichedNotification =
            state.data?.enableNotification == 1 ? true : false;
        isSwichedAdvertisement =
            state.data?.enableAdvertisementNotification == 1 ? true : false;
      } else if (state is ToggleNotificationFailure) {
        snackbarError(context, state.errorMessage);
      }
    }, builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).notifications,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.textStyle16_800.copyWith(
              color: AppColors.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Icon(
                  Iconsax.notification_bing5,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).pushNotifications,
                        style: AppStyles.textStyle14_700Black),
                    Text(S.of(context).pushNotificationsDescription,
                        style: AppStyles.textStyle12_700Grey),
                  ],
                ),
                const Spacer(),
                CupertinoSwitch(
                    activeColor: AppColors.black,
                    value: isSwichedNotification,
                    onChanged: (value) {
                      setState(() {
                        isSwichedNotification = value;
                      });
                      BlocProvider.of<ProfileCubit>(context).toggleNotification(
                          enableNotification: isSwichedNotification ? 1 : 0,
                          enableAdvertisement: null);
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Row(
              children: [
                const Icon(
                  Iconsax.notification_bing5,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).advertiseNotifications,
                        style: AppStyles.textStyle14_700Black),
                    Text(S.of(context).advertiseNotificationsDescription,
                        style: AppStyles.textStyle12_700Grey),
                  ],
                ),
                const Spacer(),
                CupertinoSwitch(
                    activeColor: AppColors.black,
                    value: isSwichedAdvertisement,
                    onChanged: (value) {
                      setState(() {
                        isSwichedAdvertisement = value;
                      });
                      BlocProvider.of<ProfileCubit>(context).toggleNotification(
                          enableNotification: null,
                          enableAdvertisement: isSwichedAdvertisement ? 1 : 0);
                    }),
              ],
            ),
          ),
        ],
      );
    });
  }
}
