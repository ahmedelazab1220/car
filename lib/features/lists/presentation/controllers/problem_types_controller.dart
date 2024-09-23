import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:car_help/features/lists/presentation/manager/districts%20cubit/districts_cubit.dart';
import 'package:car_help/features/lists/presentation/manager/problem%20types%20cubit/problem_types_cubit.dart';
import 'package:car_help/features/lists/presentation/widgets/single_select.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProblemTypesController extends StatefulWidget {
  final void Function(int?) onSelectedId;
  final DropDownEntity? selectedId;
  const ProblemTypesController({
    super.key,
    required this.onSelectedId,
    this.selectedId,
  });

  @override
  State<ProblemTypesController> createState() => _ProblemTypesControllerState();
}

class _ProblemTypesControllerState extends State<ProblemTypesController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProblemTypesCubit(getIt.get<ListsRepo>())..getProblemTypes(),
      child: BlocConsumer<ProblemTypesCubit, ProblemTypesState>(
        listener: (context, state) {
          if (state is ProblemTypesLoading) {
            isLoading = true;
          } else if (state is ProblemTypesSuccess) {
            isLoading = false;
            data = state.data;
          } else if (state is ProblemTypesFailure) {
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
                hintTitle: S.of(context).chooseProblemType,
                labaleText: S.of(context).problemType,
                onSelectedId: widget.onSelectedId),
          );
        },
      ),
    );
  }
}
