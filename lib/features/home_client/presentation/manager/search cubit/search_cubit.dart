import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeClientRepo homeClientRepo;
  SearchCubit(
    this.homeClientRepo,
  ) : super(SearchInitial());

  Future<void> search({required int categoryId, required String query}) async {
    emit(SearchLoading());
    var result =
        await homeClientRepo.search(categoryId: categoryId, query: query);
    result.fold(
      (failure) => emit(SearchFailure(errorMessage: failure.errMessage)),
      (success) => emit(SearchSuccess(data: success)),
    );
  }
}
