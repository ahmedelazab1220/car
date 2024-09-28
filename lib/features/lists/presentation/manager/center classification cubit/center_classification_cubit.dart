import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'center_classification_state.dart';

class CenterClassificationCubit extends Cubit<CenterClassificationState> {
  final HomeClientRepo homeRepo;

  CenterClassificationCubit(
    this.homeRepo,
  ) : super(CenterClassificationInitial());

  Future<void> getServices({String? type}) async {
    emit(CenterClassificationLoading());
    var result = await homeRepo.getServices();
    result.fold(
      (failure) => {
        emit(
          CenterClassificationFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          CenterClassificationSuccess(data: success),
        ),
      },
    );
  }
}
