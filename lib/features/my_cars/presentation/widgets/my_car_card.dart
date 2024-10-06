import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/my_cars/doman/entities/mycars_entity.dart';
import 'package:car_help/features/my_cars/presentation/manager/mycars%20cubit/my_cars_cubit.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class MyCarCard extends StatefulWidget {
  final int carIndex;
  final MyCarsEntity data;
  const MyCarCard({
    super.key,
    required this.data,
    required this.carIndex,
  });

  @override
  State<MyCarCard> createState() => _MyCarCardState();
}

class _MyCarCardState extends State<MyCarCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isExpanded
                  ? AppColors.primary
                  : AppColors.grey.withOpacity(0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${S.of(context).car} ${widget.carIndex + 1}',
                    style: AppStyles.textStyle14_700Black,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<MyCarsCubit>(context)
                          .deleteMyCar(id: widget.data.id);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.deleteIcon,
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          S.of(context).delete,
                          style: AppStyles.textStyle14_700Black,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                color: AppColors.black,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).carBrand,
                    style: AppStyles.textStyle12_700Grey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    widget.data.carFactory?.title ?? '',
                    style: AppStyles.textStyle14_700Black,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    S.of(context).carModel,
                    style: AppStyles.textStyle12_700Grey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    widget.data.carModel?.title ?? '',
                    style: AppStyles.textStyle14_700Black,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    S.of(context).carType,
                    style: AppStyles.textStyle12_700Grey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    widget.data.manufactureYear ?? '',
                    style: AppStyles.textStyle14_700Black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
