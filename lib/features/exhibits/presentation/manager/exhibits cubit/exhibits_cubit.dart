import 'package:bloc/bloc.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/domain/repos/exhibits_repo.dart';
import 'package:equatable/equatable.dart';

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

  Future<void> addExhibits(
      {int? carFactoryId, int? carModelId, String? manufactureYear}) async {
    emit(ExhibitsLoading());
    var result = await exhibitsRepo.addExhibits();
    result.fold(
      (failure) => {
        emit(
          ExhibitsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        getExhibits(),
        emit(
          ExhibitsSuccess(data: list),
        ),
      },
    );
  }

  Future<void> updateExhibits({required ExhibitsEntity data}) async {
    emit(ExhibitsLoading());
    final result = await exhibitsRepo.updateExhibits();
    result.fold(
      (failure) => emit(ExhibitsFailure(errorMessage: failure.errMessage)),
      (success) {
        final index = list.indexWhere((element) => element.id == data.id);
        if (index != -1) {
          list[index] = data;
        }
        emit(ExhibitsSuccess(data: list));
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
