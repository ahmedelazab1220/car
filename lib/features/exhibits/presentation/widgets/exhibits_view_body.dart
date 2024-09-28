import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/presentation/widgets/exhibits_list_view.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExhibitsViewBody extends StatelessWidget {
  final List<ExhibitsEntity> data;
  const ExhibitsViewBody({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${S.of(context).thereAre} ${data.length} ${S.of(context).exhibitsYouHave}',
              style: AppStyles.textStyle14_800Black,
            ),
          ),
          ExhibitsListView(
            data: data,
          )
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
        onPressed: () => GoRouter.of(context).push(
          AppRouter.kAddExhibitView,
        ),
      ),
    );
  }
}
