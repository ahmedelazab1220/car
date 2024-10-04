import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkingDaysViewBody extends StatelessWidget {
  final List<ProviderTimesEntity> data;
  const WorkingDaysViewBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return WorkingDaysCard(
            data: data[index],
          );
        },
      ),
    );
  }
}

class WorkingDaysCard extends StatefulWidget {
  final ProviderTimesEntity data;
  const WorkingDaysCard({
    super.key,
    required this.data,
  });

  @override
  State<WorkingDaysCard> createState() => _WorkingDaysCardState();
}

class _WorkingDaysCardState extends State<WorkingDaysCard> {
  bool isSwiched = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  S.of(context).saturday,
                  style: AppStyles.textStyle14_400,
                ),
                const Spacer(),
                InkWell(
                  child: const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  onTap: () {
                    showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                  },
                ),
                Text(S.of(context).edit),
              ],
            ),
            const Divider(),
            Text(
              '${S.of(context).from} ${widget.data.from} ${S.of(context).to} ${widget.data.to}',
              style: AppStyles.textStyle14_400,
            ),
            Row(
              children: [
                CupertinoSwitch(
                    activeColor: AppColors.black,
                    value: isSwiched,
                    onChanged: (value) {
                      setState(() {
                        isSwiched = value;
                      });
                    }),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  S.of(context).closed,
                  style: AppStyles.textStyle14_400.copyWith(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
