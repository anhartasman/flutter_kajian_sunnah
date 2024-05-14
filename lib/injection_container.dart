import 'package:kajiansunnah/architectures/data/repositories/DataHomeRepository.dart';
import 'package:kajiansunnah/architectures/domain/repositories/AccountRepository.dart';
import 'package:kajiansunnah/architectures/domain/repositories/HomeRepository.dart';
import 'package:kajiansunnah/architectures/domain/usecases/GetLoggedInUserUseCase.dart';
import 'package:kajiansunnah/architectures/domain/usecases/GetTopicUseCase.dart';
import 'package:kajiansunnah/architectures/domain/usecases/GetUstadzProfileUseCase.dart';
import 'package:kajiansunnah/architectures/domain/usecases/UserLoginUseCase.dart';
import 'package:get_it/get_it.dart';
import 'package:kajiansunnah/architectures/data/repositories/DataAccountRepository.dart';
import 'package:kajiansunnah/architectures/domain/usecases/UserLogoutUseCase.dart';
import 'package:kajiansunnah/architectures/domain/usecases/UserRegisterUseCase.dart';
import 'package:kajiansunnah/bloc/get_topic/bloc.dart';
import 'package:kajiansunnah/bloc/get_ustadz/bloc.dart';
import 'package:kajiansunnah/bloc/home_nav/bloc.dart';
import 'package:kajiansunnah/bloc/splash_check/splash_check_bloc.dart';
import 'package:kajiansunnah/bloc/user_login/user_login_bloc.dart';
import 'package:kajiansunnah/bloc/user_register/user_register_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases

  sl.registerLazySingleton(() => UserLoginUseCase(sl()));
  sl.registerLazySingleton(() => UserRegisterUseCase(sl()));
  sl.registerLazySingleton(() => GetLoggedInUserUseCase(sl()));
  sl.registerLazySingleton(() => UserLogoutUseCase(sl()));
  sl.registerLazySingleton(() => GetTopicUseCase(sl()));
  sl.registerLazySingleton(() => GetUstadzProfileUseCase(sl()));

  // Repository

  sl.registerLazySingleton<AccountRepository>(
    () => DataAccountRepository(),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => DataHomeRepository(),
  );

  sl.registerFactory(
    () => HomeNavBloc(
      userLogoutUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => SplashCheckBloc(
      getLoggedInUserUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => UserLoginBloc(
      userLoginUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => UserRegisterBloc(
      userRegisterUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => GetTopicBloc(
      getTopicUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => GetUstadzProfileBloc(
      getUstadzProfileUseCase: sl(),
    ),
  );
}
