import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:car_help/features/lists/presentation/manager/car%20factories%20cubit/car_factories_cubit.dart';
import 'package:car_help/features/lists/presentation/widgets/single_select.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CarFactoriesController extends StatefulWidget {
  final void Function(int?) onSelectedId;
  final DropDownEntity? selectedId;
  const CarFactoriesController({
    super.key,
    required this.onSelectedId,
    this.selectedId,
  });

  @override
  State<CarFactoriesController> createState() => _CarFactoriesControllerState();
}

class _CarFactoriesControllerState extends State<CarFactoriesController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CarFactoriesCubit(getIt.get<ListsRepo>())..getCarFactories(),
      child: BlocConsumer<CarFactoriesCubit, CarFactoriesState>(
        listener: (context, state) {
          if (state is CarFactoriesFailure) {
            isLoading = true;
          } else if (state is CarFactoriesSuccess) {
            isLoading = false;
            data = state.data;
          } else if (state is CarFactoriesFailure) {
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
                hintTitle: S.of(context).chooseBrandCar,
                labaleText: S.of(context).carBrand,
                onSelectedId: widget.onSelectedId),
          );
        },
      ),
    );
  }
}
