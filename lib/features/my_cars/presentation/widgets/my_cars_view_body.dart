import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/my_cars/doman/entities/mycars_entity.dart';
import 'package:car_help/features/my_cars/presentation/my_cars_helper.dart';
import 'package:car_help/features/my_cars/presentation/widgets/my_car_card.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class MyCarsViewBody extends StatelessWidget {
  final List<MyCarsEntity> data;
  const MyCarsViewBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              '${S.of(context).thereAre} ${data.length} ${S.of(context).carsYouHave}',
              style: AppStyles.textStyle14_800Black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return MyCarCard(
                    data: data[index],
                    carIndex: index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: AppColors.primary,
        child: Icon(
          Icons.add,
          color: AppColors.black,
        ),
        onPressed: () {
          MyCarsHelper.showBottomSheetDialog(context: context);
        },
      ),
    );
  }
}
