import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:car_help/features/lists/presentation/manager/car%20models%20cubit/car_models_cubit.dart';
import 'package:car_help/features/lists/presentation/widgets/single_select.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CarModelsController extends StatefulWidget {
  final void Function(int?) onSelectedId;
  final DropDownEntity? selectedId;
  const CarModelsController({
    super.key,
    required this.onSelectedId,
    this.selectedId,
  });

  @override
  State<CarModelsController> createState() => _CarModelsControllerState();
}

class _CarModelsControllerState extends State<CarModelsController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CarModelsCubit(getIt.get<ListsRepo>())..getCarModels(),
      child: BlocConsumer<CarModelsCubit, CarModelsState>(
        listener: (context, state) {
          if (state is CarModelsLoading) {
            isLoading = true;
          } else if (state is CarModelsSuccess) {
            isLoading = false;
            data = state.data;
          } else if (state is CarModelsFailure) {
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
                hintTitle: S.of(context).chooseModelCar,
                labaleText: S.of(context).carModel,
                onSelectedId: widget.onSelectedId),
          );
        },
      ),
    );
  }
}
