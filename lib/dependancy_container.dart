// ignore_for_file: cascade_invocations

import 'package:dukkantek/features/home/data/data_sources/home_data_source.dart';
import 'package:dukkantek/features/home/data/data_sources/local_home_data_source.dart';
import 'package:dukkantek/features/home/data/repositories/home_repository_imp.dart';
import 'package:dukkantek/features/home/domain/repositories/home_repository.dart';
import 'package:dukkantek/features/home/domain/usecases/get_user.dart';
import 'package:dukkantek/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:dukkantek/features/login/domain/usecases/sign_up.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/helpers/textfeild_validator.dart';

import 'features/login/data/data_sources/local_login_data_source.dart';
import 'features/login/data/data_sources/login_data_source.dart';
import 'features/login/data/repositories/login_repository_imp.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/usecases/login.dart';
import 'features/login/presentation/bloc/cubit/login_cubit.dart';
import 'features/login/presentation/bloc/cubit/signup_cubit.dart';

GetIt locator = GetIt.instance;

Future<void> setupServicesLocator() async {
  /// register all the call flow with the service locator
  /// bloc => usecase => repository => datasource

//blocs
  locator.registerFactory(
    () => LoginCubit(
      userLogin: locator(),
    ),
  );

  locator.registerFactory(
    () => SignupCubit(
      signUp: locator(),
    ),
  );

  locator.registerFactory(
    () => HomeCubit(
      getUser: locator(),
    ),
  );

//usecases
  locator.registerLazySingleton(() => LoginUser(locator()));
  locator.registerLazySingleton(() => SignUp(locator()));
  locator.registerLazySingleton(() => GetUser(locator()));

//repositories
  locator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
        loginDataSource: locator(), localLoginDataSource: locator()),
  );
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
        homeDataSource: locator(), localHomeDataSource: locator()),
  );

//data sources
  locator.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(),
  );

  locator.registerLazySingleton<LocalLoginDataSource>(
    () => LocalLoginDataSourceImpl(sharedPreferences: locator()),
  );
  locator.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(),
  );

  locator.registerLazySingleton<LocalHomeDataSource>(
    () => LocalHomeDataSourceImpl(sharedPreferences: locator()),
  );

  //external
  final _sharedPreferences = SharedPreferences.getInstance();
  final SharedPreferences sharedPreferences = await _sharedPreferences;
  locator.registerLazySingleton(() => sharedPreferences);

  TextFieldValidator textFieldValidator = TextFieldValidator();
  locator.registerLazySingleton(() => textFieldValidator);
}
