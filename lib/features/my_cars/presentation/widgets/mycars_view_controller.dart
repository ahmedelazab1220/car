import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/my_cars/presentation/manager/mycars%20cubit/my_cars_cubit.dart';
import 'package:car_help/features/my_cars/presentation/widgets/my_cars_view_body.dart';
import 'package:car_help/features/my_cars/presentation/widgets/mycars_empty_view.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCarsViewController extends StatefulWidget {
  const MyCarsViewController({
    super.key,
  });

  @override
  State<MyCarsViewController> createState() => _MyCarsViewControllerState();
}

class _MyCarsViewControllerState extends State<MyCarsViewController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];
  @override
  void initState() {
    BlocProvider.of<MyCarsCubit>(context).getMyCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<MyCarsCubit>(context).getMyCars();
      },
      child: BlocBuilder<MyCarsCubit, MyCarsState>(builder: (context, state) {
        if (state is MyCarsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyCarsSuccess) {
          if (state.data.isEmpty) {
            return const MyCarsEmptyView();
          } else {
            return MyCarsViewBody(data: state.data);
          }
        } else if (state is MyCarsFailure) {
          return Expanded(
            child: FailuresWidget(errorMessage: state.errorMessage),
          );
        }

        return const CircularProgressIndicator();
      }),
    );
  }
}
