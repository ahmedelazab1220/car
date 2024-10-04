import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_provider/presentation/manager/home%20provider%20cubit/home_provider_cubit.dart';
import 'package:car_help/features/home_provider/presentation/widgets/statistics_card.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProviderController extends StatefulWidget {
  const HomeProviderController({super.key});

  @override
  State<HomeProviderController> createState() => _HomeProviderControllerState();
}

class _HomeProviderControllerState extends State<HomeProviderController> {
  int newOrder = 0;
  int onGoing = 0;
  int completedOrders = 0;
  int cancelledOrders = 0;
  int exhibits = 0;
  bool isLoading = false;
  String? failure;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeProviderCubit, HomeProviderState>(
      listener: (context, state) {
        if (state is HomeProviderLoading) {
          isLoading = true;
        } else if (state is HomeProviderSuccess) {
          newOrder = state.data.pending ?? 0;
          onGoing = state.data.inProgress ?? 0;
          completedOrders = state.data.completed ?? 0;
          cancelledOrders = state.data.canceled ?? 0;
          exhibits = state.data.exhibts?.length ?? 0;
          isLoading = false;
          failure = null;
        } else if (state is HomeProviderFailure) {
          isLoading = false;
          failure = state.errorMessage;
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isLoading)
              // const Center(
              //   child: CircularProgressIndicator(),
              // ),
              if (failure != null)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(),
                  child: Text(
                    failure!,
                    style:
                        AppStyles.textStyle16_800.copyWith(color: Colors.red),
                  ),
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).yourStatistics,
                style: AppStyles.textStyle14_700Black,
              ),
            ),
            Row(
              children: [
                StatisticsCard(
                  title: S.of(context).newOrders,
                  number: newOrder.toString(),
                ),
                StatisticsCard(
                  title: S.of(context).onGoing,
                  number: onGoing.toString(),
                )
              ],
            ),
            Row(
              children: [
                StatisticsCard(
                  title: S.of(context).completedOrders,
                  number: completedOrders.toString(),
                ),
                StatisticsCard(
                  title: S.of(context).cancelledOrders,
                  number: cancelledOrders.toString(),
                )
              ],
            ),
            Row(
              children: [
                StatisticsCard(
                  title: S.of(context).exhibits,
                  number: exhibits.toString(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
