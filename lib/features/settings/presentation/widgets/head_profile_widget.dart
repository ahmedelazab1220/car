import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/profile/Presentation/manager/profile%20cubit/profile_cubit.dart';
import 'package:car_help/features/widgets/custom_network_image.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HeedProfileWidget extends StatelessWidget {
  final String userType;
  const HeedProfileWidget({
    super.key,
    required this.userType,
  });

  @override
  Widget build(BuildContext context) {
    if (userType == AppStrings.both) {
      return HeadProfileBody(
        userType: userType,
      );
    } else {
      return BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const HeadProfileBody(
              isLoading: true,
            );
          } else if (state is ProfileSuccess) {
            return HeadProfileBody(
              data: state.data,
            );
          } else if (state is ProfileFailure) {
            return const HeadProfileBody();
          }
          return const Center(
            child: Text('Something went wrong'),
          );
        },
      );
    }
  }
}

class HeadProfileBody extends StatelessWidget {
  final bool isLoading;
  final UserEntity? data;
  final String? userType;
  const HeadProfileBody({
    super.key,
    this.data,
    this.isLoading = false,
    this.userType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Text(
                  data?.name ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  data?.phone ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  height: 36,
                  width: 100,
                  title: S.of(context).edit,
                  onPressed: data == null
                      ? null
                      : () => GoRouter.of(context)
                          .push(AppRouter.kEditProfileView, extra: data),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
