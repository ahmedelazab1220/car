// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ramq/core/utils/app_colors.dart';
// import 'package:ramq/core/utils/app_size.dart';
// import 'package:ramq/core/utils/app_styles.dart';
// import 'package:ramq/features/auth/presentation/manager/update%20register%20data%20cubit/update_register_data_cubit.dart';
// import 'package:ramq/features/auth/presentation/widgets/custom_phone_field.dart';
// import 'package:ramq/features/widgets/custom_botton.dart';
// import 'package:ramq/generated/l10n.dart';

// class UpdateRegisterDataViewBody extends StatefulWidget {
//   final List list;
//   const UpdateRegisterDataViewBody({super.key, required this.list});

//   @override
//   State<UpdateRegisterDataViewBody> createState() =>
//       _UpdateRegisterDataViewBodyState();
// }

// class _UpdateRegisterDataViewBodyState
//     extends State<UpdateRegisterDataViewBody> {
//   final GlobalKey<FormState> formKey = GlobalKey();
//   String? phoneNumber;
//   bool isValid = false;

//   void _updateIsValid() {
//     setState(() {
//       isValid = formKey.currentState?.validate() ?? false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: Form(
//         key: formKey,
//         onChanged: _updateIsValid,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: SizeConfig.bodyHeight * 0.15,
//             ),
//             Text(
//               S.of(context).editNumber,
//               style: AppStyles.textStyle24_700,
//             ),
//             SizedBox(
//               height: SizeConfig.bodyHeight * 0.03,
//             ),
//             Text(
//               S.of(context).phoneNumber,
//               style: AppStyles.textStyle14_700Black,
//             ),
//             CustomPhoneFormField(
//               onChanged: (value) {
//                 setState(() {
//                   phoneNumber = value?.completeNumber;
//                 });
//               },
//             ),
//             SizedBox(
//               height: SizeConfig.bodyHeight * 0.02,
//             ),
//             CustomButton(
//               colors: isValid
//                   ? null
//                   : [
//                       AppColors.primaryYellow.withOpacity(0.6),
//                       AppColors.primaryYellow.withOpacity(0.6)
//                     ],
//               margin: const EdgeInsets.all(0),
//               title: S.of(context).editNumber,
//               onPressed: isValid
//                   ? () {
//                       if (formKey.currentState!.validate()) {
//                         BlocProvider.of<UpdateRegisterDataCubit>(context)
//                             .updateRegisterData(
//                                 phone: phoneNumber, userId: widget.list[1]);
//                       }
//                     }
//                   : null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
