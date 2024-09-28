import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/addresses/domain/repos/addresses_repo.dart';
import 'package:car_help/features/addresses/presentation/manager/addresses%20cubit/addresses_cubit.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/presentation/widgets/single_select.dart';
import 'package:car_help/features/widgets/snackbar_error.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddressesController extends StatefulWidget {
  final void Function(int?) onSelectedId;
  final DropDownEntity? selectedId;
  const AddressesController({
    super.key,
    required this.onSelectedId,
    this.selectedId,
  });

  @override
  State<AddressesController> createState() => _AddressesControllerState();
}

class _AddressesControllerState extends State<AddressesController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddressesCubit(getIt.get<AddressesRepo>())..getAddresses(),
      child: BlocConsumer<AddressesCubit, AddressesState>(
        listener: (context, state) {
          if (state is AddressesLoading) {
            isLoading = true;
          } else if (state is AddressesSuccess) {
            isLoading = false;
            for (var e in state.data) {
              data.add(DropDownEntity(id: e.id, title: e.address));
            }
          } else if (state is AddressesFailure) {
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
                hintTitle: S.of(context).address,
                labaleText: S.of(context).chooseAddress,
                onSelectedId: widget.onSelectedId),
          );
        },
      ),
    );
  }
}
