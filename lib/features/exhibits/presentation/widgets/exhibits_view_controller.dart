import 'package:car_help/features/exhibits/presentation/manager/exhibits%20cubit/exhibits_cubit.dart';
import 'package:car_help/features/exhibits/presentation/widgets/exhibits_empty_view.dart';
import 'package:car_help/features/exhibits/presentation/widgets/exhibits_view_body.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExhibitsViewController extends StatefulWidget {
  const ExhibitsViewController({
    super.key,
  });

  @override
  State<ExhibitsViewController> createState() => _ExhibitsViewControllerState();
}

class _ExhibitsViewControllerState extends State<ExhibitsViewController> {
  bool isLoading = false;

  List<DropDownEntity> data = [];
  @override
  void initState() {
    BlocProvider.of<ExhibitsCubit>(context).getExhibits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<ExhibitsCubit>(context).getExhibits();
      },
      child:
          BlocBuilder<ExhibitsCubit, ExhibitsState>(builder: (context, state) {
        if (state is ExhibitsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ExhibitsSuccess) {
          if (state.data.isEmpty) {
            return const ExhibitsEmptyView();
          } else {
            return ExhibitsViewBody(data: state.data);
          }
        } else if (state is ExhibitsFailure) {
          return Expanded(
            child: FailuresWidget(errorMessage: state.errorMessage),
          );
        }

        return const CircularProgressIndicator();
      }),
    );
  }
}
