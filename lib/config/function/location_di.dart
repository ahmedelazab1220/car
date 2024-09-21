import 'package:car_help/core/api/http_consumer.dart';
import 'package:get_it/get_it.dart';
import 'package:car_help/features/location/data/datasources/location_remote_data_source.dart';
import 'package:car_help/features/location/data/repositories/location_repository_impl.dart';
import 'package:car_help/features/location/domain/repositories/location_repository.dart';
import 'package:car_help/features/location/domain/usecases/fetch_suggestion_location_use_case.dart';
import 'package:car_help/features/location/domain/usecases/get_address_title_by_location_use_case.dart';
import 'package:car_help/features/location/domain/usecases/get_cities_use_case.dart';
import 'package:car_help/features/location/domain/usecases/get_distracts_use_case.dart';
import 'package:car_help/features/location/domain/usecases/get_my_location_use_case.dart';
import 'package:car_help/features/location/domain/usecases/get_place_location_by_id_use_case.dart';
import 'package:car_help/features/location/domain/usecases/update_my_location_use_case.dart';
import 'package:car_help/features/location/presentation/cubit/location_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///Features

  sl.registerLazySingleton(() => MapClientConsumer());
  sl.registerFactory(() => LocationCubit(
        sl(),
        sl(),
        sl(),
        sl(),
      ));

  //useCases
  sl.registerLazySingleton(
      () => GetMyLocationUseCase(locationRepository: sl()));
  sl.registerLazySingleton(
      () => FetchSuggestionLocationUseCase(locationRepository: sl()));
  sl.registerLazySingleton(
      () => GetPlaceLocationByIdUseCase(locationRepository: sl()));
  sl.registerLazySingleton(
      () => GetAddressTitleByLocationUseCase(locationRepository: sl()));
  sl.registerLazySingleton(() => GetCitiesUseCase(locationRepository: sl()));
  sl.registerLazySingleton(() => GetDistractsUseCase(locationRepository: sl()));
  sl.registerLazySingleton(
      () => UpdateMyLocationUseCase(locationRepository: sl()));

  //Repository
  sl.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl(
        locationRemoteDataSource: sl(),
      ));

  //DataSource
  sl.registerLazySingleton<LocationRemoteDataSource>(() =>
      LocationRemoteDataSourceImpl(mapClientConsumer: sl(), apiService: sl()));
}
