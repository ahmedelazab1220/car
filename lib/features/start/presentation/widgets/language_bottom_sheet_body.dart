import 'package:car_help/features/start/presentation/widgets/custom_buttons_language.dart';
import 'package:flutter/widgets.dart';

class LanguageBottomSheetBody extends StatelessWidget {
  final bool? isLocale;

  const LanguageBottomSheetBody({super.key, this.isLocale});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          CustomBottonsLanguage(
            isLocale: isLocale,
          ),
        ],
      ),
    );
  }
}
