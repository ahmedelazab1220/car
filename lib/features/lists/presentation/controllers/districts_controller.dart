import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/presentation/manager/districts%20cubit/districts_cubit.dart';
import 'package:car_help/features/lists/presentation/widgets/single_select.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DistrictsController extends StatefulWidget {
  final void Function(int?) onSelectedId;
  final DropDownEntity? selectedId;
  const DistrictsController({
    super.key,
    required this.onSelectedId,
    this.selectedId,
  });

  @override
  State<DistrictsController> createState() => _DistrictsControllerState();
}

class _DistrictsControllerState extends State<DistrictsController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DistrictsCubit, DistrictsState>(
      listener: (context, state) {
        if (state is DistrictsLoading) {
          isLoading = true;
        } else if (state is DistrictsSuccess) {
          isLoading = false;
          data = state.data;
        } else if (state is DistrictsFailure) {
          isLoading = false;
          snackbarError(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return SingleSelectSheet(
            selectedId: widget.selectedId,
            categories: data,
            hintTitle: S.of(context).district,
            labaleText: S.of(context).chooseDistrict,
            onSelectedId: widget.onSelectedId);
      },
    );
  }
}
