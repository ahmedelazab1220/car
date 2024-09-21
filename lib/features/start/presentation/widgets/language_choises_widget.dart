// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_cubit.dart';
// import 'package:car_help/config/helper/locale_helper/locale_cubit/locale_state.dart';
// import 'package:car_help/core/utils/app_size.dart';

// import '../../../../generated/l10n.dart';
// import 'custom_choises_item.dart';

// class LanguageChoicesWidget extends StatelessWidget {
//   const LanguageChoicesWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LocaleCubit, LocaleState>(
//       listener: (context, state) {
//         if (state is ChangeLocaleState) {
//           Navigator.pop(context);
//         }
//       },
//       builder: (context, state) {
//         LocaleCubit cubit = LocaleCubit.get(context);
//         return Column(
//           children: [
//             CustomChoicesItemWidget(
//               onChanged: (index) => cubit.toggleLanguage(2),
//               text: S.of(context).arabic,
//               value: 2,
//               groupValue: cubit.selectedAppLang,
//             ),
//             SizedBox(height: SizeConfig.bodyHeight * .02),
//             CustomChoicesItemWidget(
//               onChanged: (index) => cubit.toggleLanguage(1),
//               text: S.of(context).english,
//               value: 1,
//               groupValue: cubit.selectedAppLang,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
