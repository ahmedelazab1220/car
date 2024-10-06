import 'dart:io';

import 'package:equatable/equatable.dart';

import 'package:car_help/features/home_provider/domain/repos/home_provider_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_offer_state.dart';

class SendOfferCubit extends Cubit<SendOfferState> {
  final HomeProviderRepo homeProviderRepo;
  SendOfferCubit(
    this.homeProviderRepo,
  ) : super(SendOfferInitial());

  Future<void> sendOffer({
    String? offerType,
    int? orderId,
    double? price,
    String? description,
    double? lowPrice,
    double? highPrice,
    File? image,
  }) async {
    emit(SendOfferLoading());
    var result = await homeProviderRepo.sendOffer(
        offerType: offerType,
        orderId: orderId,
        price: price,
        description: description,
        lowPrice: lowPrice,
        highPrice: highPrice,
        image: image);
    result.fold(
      (failure) => {
        emit(
          SendOfferFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          SendOfferSuccess(message: success),
        ),
      },
    );
  }
}
