import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'districts_state.dart';

class DistrictsCubit extends Cubit<DistrictsState> {
  final ListsRepo listsRepo;

  DistrictsCubit(
    this.listsRepo,
  ) : super(DistrictsInitial());

  Future<void> getDistricts({int? id}) async {
    emit(DistrictsLoading());
    var result = await listsRepo.getDistricts(id: id);
    result.fold(
      (failure) => {
        emit(
          DistrictsFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          DistrictsSuccess(data: success),
        ),
      },
    );
  }
}
