part of 'send_offer_cubit.dart';

sealed class SendOfferState extends Equatable {
  const SendOfferState();

  @override
  List<Object> get props => [];
}

final class SendOfferInitial extends SendOfferState {}

final class SendOfferLoading extends SendOfferState {}

final class SendOfferSuccess extends SendOfferState {
  final String message;

  const SendOfferSuccess({required this.message});
}

final class SendOfferFailure extends SendOfferState {
  final String errorMessage;

  const SendOfferFailure({required this.errorMessage});
}
