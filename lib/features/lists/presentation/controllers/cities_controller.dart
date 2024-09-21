import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:car_help/features/lists/presentation/manager/cities%20cubit/cities_cubit.dart';
import 'package:car_help/features/lists/presentation/widgets/single_select.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CitiesController extends StatefulWidget {
  final void Function(int?) onSelectedId;
  final DropDownEntity? selectedId;
  const CitiesController({
    super.key,
    required this.onSelectedId,
    this.selectedId,
  });

  @override
  State<CitiesController> createState() => _CitiesControllerState();
}

class _CitiesControllerState extends State<CitiesController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CitiesCubit(getIt.get<ListsRepo>())..getCities(),
      child: BlocConsumer<CitiesCubit, CitiesState>(
        listener: (context, state) {
          if (state is CitiesLoading) {
            isLoading = true;
          } else if (state is CitiesSuccess) {
            isLoading = false;
            data = state.data;
          } else if (state is CitiesFailure) {
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
                hintTitle: S.of(context).city,
                labaleText: S.of(context).chooseCity,
                onSelectedId: widget.onSelectedId),
          );
        },
      ),
    );
  }
}
