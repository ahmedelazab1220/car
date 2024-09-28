import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/presentation/widgets/single_select.dart';
import 'package:car_help/features/my_cars/doman/repos/mycars_repo.dart';
import 'package:car_help/features/my_cars/presentation/manager/mycars%20cubit/my_cars_cubit.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MyCarsController extends StatefulWidget {
  final void Function(int?) onSelectedId;
  final DropDownEntity? selectedId;
  const MyCarsController({
    super.key,
    required this.onSelectedId,
    this.selectedId,
  });

  @override
  State<MyCarsController> createState() => _MyCarsControllerState();
}

class _MyCarsControllerState extends State<MyCarsController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCarsCubit(getIt.get<MyCarsRepo>())..getMyCars(),
      child: BlocConsumer<MyCarsCubit, MyCarsState>(
        listener: (context, state) {
          if (state is MyCarsLoading) {
            isLoading = true;
          } else if (state is MyCarsSuccess) {
            isLoading = false;
            for (var e in state.data) {
              data.add(
                DropDownEntity(
                  id: e.id,
                  title: e.carFactory?.title,
                ),
              );
            }
          } else if (state is MyCarsFailure) {
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
                hintTitle: S.of(context).selectCar,
                labaleText: S.of(context).chooseCar,
                onSelectedId: widget.onSelectedId),
          );
        },
      ),
    );
  }
}
