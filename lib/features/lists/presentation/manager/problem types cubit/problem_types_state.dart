part of 'problem_types_cubit.dart';

sealed class ProblemTypesState extends Equatable {
  const ProblemTypesState();

  @override
  List<Object> get props => [];
}

final class ProblemTypesInitial extends ProblemTypesState {}

final class ProblemTypesLoading extends ProblemTypesState {}

final class ProblemTypesSuccess extends ProblemTypesState {
  final List<DropDownEntity> data;

  const ProblemTypesSuccess({required this.data});
}

final class ProblemTypesFailure extends ProblemTypesState {
  final String errorMessage;

  const ProblemTypesFailure({required this.errorMessage});
}
