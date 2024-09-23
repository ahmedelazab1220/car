import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/addresses/domain/entities/address_entity.dart';
import 'package:car_help/features/addresses/presentation/manager/addresses%20cubit/addresses_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_content.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddressCard extends StatefulWidget {
  final AddressEntity data;
  final int index;
  const AddressCard({super.key, required this.data, required this.index});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool isExpanded = false;
  @override
  void initState() {
    isExpanded = widget.data.isDefault == 1 ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
            BlocProvider.of<AddressesCubit>(context).updateAddress(
              AddressEntity(
                id: widget.data.id,
                ownerName: widget.data.ownerName ?? '',
                ownerPhone: widget.data.ownerPhone ?? '',
                lat: widget.data.lat,
                lng: widget.data.lng,
                address: widget.data.address,
                isDefault: isExpanded ? 1 : 0,
              ),
            );
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
                    '${S.of(context).address} ${widget.index + 1}',
                    style: AppStyles.textStyle14_700Black,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  if (isExpanded)
                    CustomContent(
                      name: S.of(context).isDefault,
                    ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<AddressesCubit>(context)
                          .deleteAddress(id: widget.data.id ?? 0);
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
                  ),
                ],
              ),
              Divider(
                color: AppColors.black,
              ),
              Row(
                children: [
                  Text(
                    S.of(context).fullName,
                    style: AppStyles.textStyle12_700Grey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    widget.data.ownerName ?? '',
                    style: AppStyles.textStyle14_700Black,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).address,
                    style: AppStyles.textStyle12_700Grey,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * .7,
                    child: Text(
                      widget.data.address ?? '',
                      style: AppStyles.textStyle14_700Black,
                    ),
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
                    widget.data.ownerPhone ?? '',
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
