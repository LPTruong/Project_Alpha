import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:project_alpha/core/network/network_info.dart';
import 'package:project_alpha/features/data/datasources/warning_local_data_source.dart';
import 'package:project_alpha/features/data/datasources/warning_remote_data_source.dart';
import 'package:project_alpha/features/data/repositories/warning_repository_impl.dart';
import 'package:project_alpha/features/domain/repositories/warnings_repository.dart';
import 'package:project_alpha/features/domain/usecases/add_warning.dart';
import 'package:project_alpha/features/domain/usecases/delete_warning.dart';
import 'package:project_alpha/features/domain/usecases/get_all_warnings.dart';
import 'package:project_alpha/features/domain/usecases/update_warning.dart';
import 'package:project_alpha/features/presentation/bloc/add_delete_update_warning/add_delete_update_warning_bloc.dart';
import 'package:project_alpha/features/presentation/bloc/warnings/warnings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => WarningsBloc(getAllWarnings: sl()));
  sl.registerFactory(() => AddDeleteUpdateWarningBloc(
      addWarning: sl(), updateWarning: sl(), deleteWarning: sl()));

  //usecases

  sl.registerLazySingleton(() => GetAllWarningsUsecase(sl()));
  sl.registerLazySingleton(() => AddWarningUseCase(sl()));
  sl.registerLazySingleton(() => UpdateWarningUseCase(sl()));
  sl.registerLazySingleton(() => DeleteWarningUseCase(sl()));

  //Repository

  sl.registerLazySingleton<WarningsRepository>(() => WarningsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //Datasources

  sl.registerLazySingleton<WarningRemoteDataSource>(
      () => WarningRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<WarningLocalDataSource>(
      () => WarningLocalDataSourceImpl(sharedPreferences: sl()));

  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
