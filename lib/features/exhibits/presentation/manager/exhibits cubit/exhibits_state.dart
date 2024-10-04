part of 'exhibits_cubit.dart';

sealed class ExhibitsState extends Equatable {
  const ExhibitsState();

  @override
  List<Object> get props => [];
}

final class ExhibitsInitial extends ExhibitsState {}

final class ExhibitsLoading extends ExhibitsState {}

final class ExhibitsSuccess extends ExhibitsState {
  final List<ExhibitsEntity> data;
  const ExhibitsSuccess({required this.data});
}

final class AddExhibitSuccess extends ExhibitsState {
  final String message;
  const AddExhibitSuccess({required this.message});
}


final class ExhibitsFailure extends ExhibitsState {
  final String errorMessage;
  const ExhibitsFailure({required this.errorMessage});
}

final class AddExhibitFailure extends ExhibitsState {
  final String errorMessage;
  const AddExhibitFailure({required this.errorMessage});
}