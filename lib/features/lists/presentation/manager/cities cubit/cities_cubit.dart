import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  final ListsRepo listsRepo;

  CitiesCubit(
    this.listsRepo,
  ) : super(CitiesInitial());

  Future<void> getCities({String? type}) async {
    emit(CitiesLoading());
    var result = await listsRepo.getCities();
    result.fold(
      (failure) => {
        emit(
          CitiesFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          CitiesSuccess(data: success),
        ),
      },
    );
  }
}
