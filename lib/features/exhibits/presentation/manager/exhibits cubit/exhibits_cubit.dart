import 'dart:io';

import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/domain/repos/exhibits_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exhibits_state.dart';

class ExhibitsCubit extends Cubit<ExhibitsState> {
  final ExhibitsRepo exhibitsRepo;
  List<ExhibitsEntity> list = [];
  ExhibitsCubit(
    this.exhibitsRepo,
  ) : super(ExhibitsInitial());

  Future<void> getExhibits() async {
    emit(ExhibitsLoading());
    var result = await exhibitsRepo.getExhibits();
    result.fold(
      (failure) => {
        emit(
          ExhibitsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        list = success,
        emit(
          ExhibitsSuccess(data: list),
        ),
      },
    );
  }

  Future<void> addExhibits({
    String? title,
    num? price,
    num? priceAfterDiscount,
    int? qty,
    String? description,
    List<File>? images,
  }) async {
    emit(ExhibitsLoading());
    var result = await exhibitsRepo.addExhibits(
        title: title,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        qty: qty,
        description: description,
        images: images);
    result.fold(
      (failure) => {
        emit(
          ExhibitsFailure(errorMessage: failure.errMessage),
        ),
        emit(
          ExhibitsSuccess(data: list),
        ),
      },
      (success) => {
        getExhibits(),
        emit(
          AddExhibitSuccess(message: success),
        ),
      },
    );
  }

  Future<void> updateExhibits({
    int? id,
    String? title,
    num? price,
    num? priceAfterDiscount,
    int? qty,
    String? description,
    List<File>? images,
  }) async {
    emit(ExhibitsLoading());
    var result = await exhibitsRepo.updateExhibits(
      id: id,
      title: title,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      qty: qty,
      description: description,
      images: images,
    );
    result.fold(
      (failure) => {
        emit(
          AddExhibitFailure(errorMessage: failure.errMessage),
        ),
        emit(
          ExhibitsSuccess(data: list),
        ),
      },
      (success) => {
        getExhibits(),
        emit(
          AddExhibitSuccess(message: success),
        ),
      },
    );
  }

  Future<void> deletaExhibits({int? id}) async {
    emit(ExhibitsLoading());
    var result = await exhibitsRepo.deletaExhibits(id: id);
    result.fold(
      (failure) => {
        emit(
          ExhibitsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        list.removeWhere((element) => element.id == id),
        emit(
          ExhibitsSuccess(data: list),
        ),
      },
    );
  }
}
