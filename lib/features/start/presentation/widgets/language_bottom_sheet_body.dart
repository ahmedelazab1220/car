import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/start/presentation/widgets/custom_buttons_language.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class LanguageBottomSheetBody extends StatelessWidget {
  const LanguageBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          CustomBottonsLanguage(),
        ],
      ),
    );
  }
}
