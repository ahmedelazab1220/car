// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:wahed/config/function/service_locator.dart';
// import 'package:wahed/features/profile/Presentation/manager/profile%20cubit/profile_cubit.dart';
// import 'package:wahed/features/profile/Presentation/manager/verify%20otp%20edit%20phone%20cubit/verify_otp_edit_phone_cubit.dart';
// import 'package:wahed/features/profile/Presentation/widgets/verify_otp_edit_phone_view_body.dart';
// import 'package:wahed/features/profile/data/repos/profile_repo_impl.dart';
// import 'package:wahed/features/widgets/snackbar_error.dart';
// import 'package:wahed/features/widgets/snackbar_success.dart';

// class VerifyOtpEditPhoneViewBloc extends StatefulWidget {
//   final String phone;
//   const VerifyOtpEditPhoneViewBloc({
//     super.key,
//     required this.phone,
//   });

//   @override
//   State<VerifyOtpEditPhoneViewBloc> createState() =>
//       _VerifyOtpEditPhoneViewBlocState();
// }

// class _VerifyOtpEditPhoneViewBlocState
//     extends State<VerifyOtpEditPhoneViewBloc> {
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => VerifyOtpEditPhoneCubit(
//         getIt.get<ProfileRepoImpl>(),
//       ),
//       child: BlocConsumer<VerifyOtpEditPhoneCubit, VerifyOtpEditPhoneState>(
//         listener: (context, state) {
//           if (state is VerifyOtpEditPhoneLoading) {
//             isLoading = true;
//           } else if (state is VerifyOtpEditPhoneSuccess) {
//             isLoading = false;
//             GoRouter.of(context).pop();
//             GoRouter.of(context).pop();
//             BlocProvider.of<ProfileCubit>(context).getProfileData(remote: true);
//             snackbarSuccess(context, state.message);
//           } else if (state is VerifyOtpEditPhoneFailure) {
//             isLoading = false;
//             snackbarError(context, state.errorMessage);
//           }
//         },
//         builder: (context, state) {
//           return ModalProgressHUD(
//             inAsyncCall: isLoading,
//             child: VeriftOtpEditPhoneViewBody(
//               phone: widget.phone,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
