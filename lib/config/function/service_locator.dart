import 'package:car_help/core/api/api_service.dart';
import 'package:car_help/features/Notification/data/data%20sourses/notification_remote_data_source.dart';
import 'package:car_help/features/Notification/data/repos/notification_repo_impl.dart';
import 'package:car_help/features/addresses/data/data_sources/addresses_local_data_sourc.dart';
import 'package:car_help/features/addresses/data/data_sources/addresses_remote_data_source.dart';
import 'package:car_help/features/addresses/data/repos/addresses_repo_impl.dart';
import 'package:car_help/features/addresses/domain/repos/addresses_repo.dart';
import 'package:car_help/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:car_help/features/auth/data/repos/auth_repo_impl.dart';
import 'package:car_help/features/exhibits/data/data_sources/exhibits_remote_data_source.dart';
import 'package:car_help/features/exhibits/data/repos/exhibits_repo_impl.dart';
import 'package:car_help/features/exhibits/domain/repos/exhibits_repo.dart';
import 'package:car_help/features/favorites/data/data_sources/favorite_remote_data_source.dart';
import 'package:car_help/features/favorites/data/repos/favorite_repo_impl.dart';
import 'package:car_help/features/favorites/domain/repos/favorite_repo.dart';
import 'package:car_help/features/home_client/data/data%20sources/home_client_local_data_source.dart';
import 'package:car_help/features/home_client/data/data%20sources/home_client_remote_data_source.dart';
import 'package:car_help/features/home_client/data/repos/home_client_repo_impl.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:car_help/features/home_provider/data/data_sources/home_provider_remote_data_source.dart';
import 'package:car_help/features/home_provider/data/repos/home_provider_repo_impl.dart';
import 'package:car_help/features/home_provider/domain/repos/home_provider_repo.dart';
import 'package:car_help/features/lists/data/data_sources/lists_remote_data_source.dart';
import 'package:car_help/features/lists/data/repos/lists_repo_impl.dart';
import 'package:car_help/features/lists/domain/repos/lists_repo.dart';
import 'package:car_help/features/my_cars/data/data_sources/mycars_remote_data_source.dart';
import 'package:car_help/features/my_cars/data/repos/mycars_repo_impl.dart';
import 'package:car_help/features/my_cars/doman/repos/mycars_repo.dart';
import 'package:car_help/features/my_services/data/data_sources/my_services_remote_data_source.dart';
import 'package:car_help/features/my_services/data/repos/my_service_repo_impl.dart';
import 'package:car_help/features/my_services/domain/repos/my_service_repo.dart';
import 'package:car_help/features/orders/data/data_sources/orders_remote_data_source.dart';
import 'package:car_help/features/orders/data/repos/orders_repo_impl.dart';
import 'package:car_help/features/orders/domain/repos/oreders_repo.dart';
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
  getIt.registerSingleton<AddressesRepo>(
    AddressesRepoImpl(
      addressesLocalDataSource: AddressesLocalDataSourceImpl(),
      addressesRemoteDataSource:
          AddressesRemoteDataSourceImpl(getIt.get<ApiService>()),
        
    ),
  );
  getIt.registerSingleton<MyCarsRepo>(
    MyCarsRepoImpl(
      myCarsRemoteDataSource:
          MyCarsRemoteDataSourceImpl(getIt.get<ApiService>()),
    ),
  );
  getIt.registerSingleton<HomeClientRepo>(
    HomeClientRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<HomeProviderRepo>(
    HomeProvierRepoImpl(
      homeProviderRemoteDataSource: HomeProviderRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<NotificationRepoImpl>(
    NotificationRepoImpl(
      notificationRemoteDataSource:
          NotificationRemoteDataSourceImpl(getIt.get<ApiService>()),
    ),
  );
  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(
      profileRemoteDataSource:
          ProfileRemoteDataSourceImpl(getIt.get<ApiService>()),
      profileLocalDataSource: ProfileLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<ExhibitsRepo>(
    ExhibitsRepoImpl(
      exhibitsRemoteDataSource:
          ExhibitsRemoteDataSourceImpl(getIt.get<ApiService>()),
    ),
  );
  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(
      ordersRemoteDataSource: OrdersRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
    getIt.registerSingleton<MyServicesRepo>(
    MyServicesRepoImpl(
      myServicesRemoteDataSource: MyServicesRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}
