import 'package:equatable/equatable.dart';

import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'problem_types_state.dart';

class ProblemTypesCubit extends Cubit<ProblemTypesState> {
  final ListsRepo listsRepo;
  ProblemTypesCubit(
    this.listsRepo,
  ) : super(ProblemTypesInitial());

  Future<void> getProblemTypes({String? type}) async {
    emit(ProblemTypesLoading());
    var result = await listsRepo.getProblemTypes();
    result.fold(
      (failure) => {
        emit(
          ProblemTypesFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          ProblemTypesSuccess(data: success),
        ),
      },
    );
  }
}
