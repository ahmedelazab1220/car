import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/presentation/manager/center%20classification%20cubit/center_classification_cubit.dart';
import 'package:car_help/features/lists/presentation/widgets/single_select.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SingleSelectClassificationController extends StatefulWidget {
  final void Function(int?) onSelectedId;
  final DropDownEntity? selectedId;
  const SingleSelectClassificationController({
    super.key,
    required this.onSelectedId,
    this.selectedId,
  });

  @override
  State<SingleSelectClassificationController> createState() =>
      _SingleSelectClassificationControllerState();
}

class _SingleSelectClassificationControllerState
    extends State<SingleSelectClassificationController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CenterClassificationCubit(getIt.get<HomeClientRepo>())..getServices(),
      child: BlocConsumer<CenterClassificationCubit, CenterClassificationState>(
        listener: (context, state) {
          if (state is CenterClassificationLoading) {
            isLoading = true;
          } else if (state is CenterClassificationSuccess) {
            isLoading = false;
            for (var e in state.data) {
              data.add(DropDownEntity(id: e.id, title: e.name));
            }
          } else if (state is CenterClassificationFailure) {
            isLoading = false;
            snackbarError(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: SingleSelectSheet(
                selectedId: widget.selectedId,
                categories: data,
                labaleText: S.of(context).centerClassification,
                hintTitle: S.of(context).chooseCenterClassification,
                onSelectedId: widget.onSelectedId),
          );
        },
      ),
    );
  }
}
