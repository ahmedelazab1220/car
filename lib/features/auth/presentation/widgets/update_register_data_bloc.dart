// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:ramq/config/function/app_router.dart';
// import 'package:ramq/config/function/service_locator.dart';
// import 'package:ramq/features/auth/data/repos/auth_repo_impl.dart';
// import 'package:ramq/features/auth/presentation/manager/update%20register%20data%20cubit/update_register_data_cubit.dart';
// import 'package:ramq/features/auth/presentation/widgets/update_register_data_view_body.dart';
// import 'package:ramq/features/widgets/snackbar_error.dart';

// class UpdateRegisterDataBloc extends StatefulWidget {
//   final List list;
//   const UpdateRegisterDataBloc({super.key, required this.list});

//   @override
//   State<UpdateRegisterDataBloc> createState() => _UpdateRegisterDataBlocState();
// }

// class _UpdateRegisterDataBlocState extends State<UpdateRegisterDataBloc> {
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UpdateRegisterDataCubit(
//         getIt.get<AuthRepoImpl>(),
//       ),
//       child: BlocConsumer<UpdateRegisterDataCubit, UpdateRegisterDataState>(
//         listener: (context, state) {
//           if (state is UpdateRegisterDataLoading) {
//             isLoading = true;
//           } else if (state is UpdateRegisterDataSuccess) {
//             isLoading = false;
//             GoRouter.of(context).pushReplacement(AppRouter.kOtpVerificationView,
//                 extra: state.list);
//           } else if (state is UpdateRegisterDataFailure) {
//             isLoading = false;
//             snackbarError(context, state.errorMessage);
//           }
//         },
//         builder: (context, state) {
//           return ModalProgressHUD(
//             inAsyncCall: isLoading,
//             child: UpdateRegisterDataViewBody(
//               list: widget.list,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
