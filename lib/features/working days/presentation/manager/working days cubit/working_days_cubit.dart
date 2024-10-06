import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:equatable/equatable.dart';

import 'package:car_help/features/orders/domain/entities/provider_times_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'working_days_state.dart';

class WorkingDaysCubit extends Cubit<WorkingDaysState> {
  final ProfileRepoImpl profileRepoImpl;
  WorkingDaysCubit(
    this.profileRepoImpl,
  ) : super(WorkingDaysInitial());

  Future<void> getWorkingTimes() async {
    emit(WorkingDaysLoading());
    var result = await profileRepoImpl.getProfileData(remote: false);
    result.fold(
      (failure) => {
        emit(
          WorkingDaysFailure(errorMessage: failure.errMessage),
        ),
      },
      (success) => {
        emit(
          WorkingDaysSuccess(data: success.workingDays ?? []),
        ),
      },
    );
  }
}
