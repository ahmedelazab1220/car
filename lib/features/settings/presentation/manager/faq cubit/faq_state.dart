part of 'faq_cubit.dart';

abstract class FaqState {}

final class FaqInitial extends FaqState {}

final class FaqLoading extends FaqState {}

final class FaqSuccess extends FaqState {
  final List<FaqEntity> data;

  FaqSuccess({required this.data});
}

final class FaqFAilure extends FaqState {
  final String errorMessage;

  FaqFAilure({required this.errorMessage});
}
