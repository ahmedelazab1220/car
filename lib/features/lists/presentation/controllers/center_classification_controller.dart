import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_repo.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:car_help/features/lists/presentation/manager/center%20classification%20cubit/center_classification_cubit.dart';
import 'package:car_help/features/lists/presentation/widgets/multi_select.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CenterClassificationController extends StatefulWidget {
  final void Function(List<int>) onSelectedIds;
  final List<ServiceEntity> selectedIds;
  const CenterClassificationController({
    super.key,
    required this.onSelectedIds,
    this.selectedIds = const [],
  });

  @override
  State<CenterClassificationController> createState() =>
      _CenterClassificationControllerState();
}

class _CenterClassificationControllerState
    extends State<CenterClassificationController> {
  bool isLoading = false;

  List<ServiceEntity> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CenterClassificationCubit(getIt.get<HomeRepo>())..getServices(),
      child: BlocConsumer<CenterClassificationCubit, CenterClassificationState>(
        listener: (context, state) {
          if (state is CenterClassificationLoading) {
            isLoading = true;
          } else if (state is CenterClassificationSuccess) {
            isLoading = false;
            data = state.data;
          } else if (state is CenterClassificationFailure) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: MultiSelectSheet(
                selectedIds: widget.selectedIds,
                categories: data,
                labalText: S.of(context).centerClassification,
                hintTitle: S.of(context).chooseCenterClassification,
                onSelectedIds: widget.onSelectedIds),
          );
        },
      ),
    );
  }
}
