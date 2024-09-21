import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/favorites/data/data_sources/favorite_remote_data_source.dart';
import 'package:car_help/features/favorites/data/repos/favorite_repo_impl.dart';
import 'package:car_help/features/favorites/domain/repos/favorite_repo.dart';
import 'package:car_help/features/home_client/data/data%20sources/home_local_data_source.dart';
import 'package:car_help/features/home_client/data/data%20sources/home_remote_data_source.dart';
import 'package:car_help/features/home_client/data/repos/home_repo_impl.dart';
import 'package:car_help/features/home_client/domain/repos/home_repo.dart';
import 'package:car_help/features/lists/data/data_sources/lists_remote_data_source.dart';
import 'package:car_help/features/lists/data/repos/lists_repo_impl.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:car_help/features/profile/data/data%20sourses/profile_local_data_source.dart';
import 'package:car_help/features/profile/data/data%20sourses/profile_remote_data_source.dart';
import 'package:car_help/features/profile/data/repos/profile_repo_impl.dart';
import 'package:car_help/features/settings/data/data%20sourses/settings_remote_data_source.dart';
import 'package:car_help/features/settings/data/repos/settings_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:car_help/config/function/location_di.dart' as location_di;

final getIt = GetIt.instance;

void serviceLocator() async {
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  await location_di.init();

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      AuthRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );

  getIt.registerSingleton<SettingsRepoImpl>(
    SettingsRepoImpl(
      settingsRemoteDataSource:
          SettingsRemoteDataSourceImpl(getIt.get<ApiService>()),
    ),
  );
  getIt.registerSingleton<ListsRepo>(
    ListsRepoImpl(
      listsRemoteDataSource: ListsRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<FavoriteRepo>(
    FavoriteRepoImpl(
      favoriteRemoteDataSource:
          FavoriteRemoteDataSourceImpl(getIt.get<ApiService>()),
    ),
  );
  // getIt.registerSingleton<ServicesRepoImpl>(
  //   ServicesRepoImpl(
  //     servicesRemoteDataSource:
  //         ServicesRemoteDataSourceImpl(getIt.get<ApiService>()),
  //   ),
  // );
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      profileRemoteDataSource:
          ProfileRemoteDataSourceImpl(getIt.get<ApiService>()),
      profileLocalDataSource: ProfileLocalDataSourceImpl(),
    ),
  );

}
