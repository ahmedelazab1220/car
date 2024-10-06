import 'package:car_help/features/addresses/presentation/manager/addresses%20cubit/addresses_cubit.dart';
import 'package:car_help/features/addresses/presentation/widgets/addresses_empty_view.dart';
import 'package:car_help/features/addresses/presentation/widgets/addresses_view_body.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressesViewController extends StatefulWidget {
  const AddressesViewController({super.key});

  @override
  State<AddressesViewController> createState() =>
      _AddressesViewControllerState();
}

class _AddressesViewControllerState extends State<AddressesViewController> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AddressesCubit>(context).getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<AddressesCubit>(context).getAddresses();
      },
      child: BlocBuilder<AddressesCubit, AddressesState>(
          builder: (context, state) {
        if (state is AddressesLoading) {
          return const LinearProgressIndicator();
        } else if (state is AddressesSuccess) {
          if (state.data.isEmpty) {
            return const AddressesEmptyView();
          } else {
            return AddressesViewBody(data: state.data);
          }
        } else if (state is AddressesFailure) {
          return FailuresWidget(errorMessage: state.errorMessage);
        }

        return const CircularProgressIndicator();
      }),
    );
  }
}
