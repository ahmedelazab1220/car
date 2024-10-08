import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_details_exhibits_card.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

class ProviderDetailsExhibits extends StatefulWidget {
  final ProviderEntity data;
  const ProviderDetailsExhibits({super.key, required this.data});

  @override
  State<ProviderDetailsExhibits> createState() =>
      _ProviderDetailsExhibitsState();
}

class _ProviderDetailsExhibitsState extends State<ProviderDetailsExhibits> {
  int? isSelectIndex;
  ExhibitsEntity? exhibits;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.data.exhibits?.length ?? 0,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ServiceDetailsExhibitsCard(
                      isSelected: isSelectIndex == index,
                      onTap: () {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            if (isSelectIndex == index) {
                              isSelectIndex = null;
                            } else {
                              isSelectIndex = index;
                              exhibits = widget.data.exhibits![index];
                            }
                          });
                        });
                      },
                      data: widget.data.exhibits![index],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        CustomButton(
          margin: const EdgeInsets.symmetric(vertical: 20),
          color: isSelectIndex != null
              ? AppColors.primary
              : AppColors.grey.withOpacity(0.4),
          titleColor: isSelectIndex != null ? AppColors.black : AppColors.grey,
          title: S.of(context).bookNaw,
          onPressed: isSelectIndex != null
              ? () {
                  GoRouter.of(context).push(AppRouter.kBookingView,
                      extra: [widget.data, exhibits]);
                }
              : null,
        ),
      ],
    );
  }
}
