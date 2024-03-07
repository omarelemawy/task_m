import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lunment_ventures/features/post/data/data_source/auth_remote_data_source.dart';
import 'package:lunment_ventures/features/post/domain/repositories/base_auth_repository.dart';
import 'package:lunment_ventures/features/post/domain/use_cases/get_comments_use_case.dart';
import 'package:lunment_ventures/features/post/domain/use_cases/get_post_details_use_case.dart';

import 'core/network/network_info.dart';
import 'features/post/data/repositories/auth_repository.dart';
import 'features/post/domain/use_cases/delete_post_use_case.dart';
import 'features/post/domain/use_cases/get_posts_use_case.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //! External
  await GetStorage.init('Task');
  const flutterSecureStorage = FlutterSecureStorage();
  final internetConnectionChecker = InternetConnectionChecker();
  // final firebaseAuth = FirebaseAuth.instance;

  Get.lazyPut(
    () => GetStorage('Task'),
    fenix: true,
  );

  Get.lazyPut(
    () => flutterSecureStorage,
    fenix: true,
  );
  Get.lazyPut(
    () => internetConnectionChecker,
    fenix: true,
  );

  //! Core
  Get.lazyPut<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: Get.find(),
    ),
    fenix: true,
  );

  ///--------------------------- AUTH FEATURE ----------------------------------

  // Data sources

  locator.registerLazySingleton<BaseAuthRemoteDataSource>(
    () => AuthRemoteDataSource(),
  );

  // Repository

  locator.registerLazySingleton<BaseAuthRepository>(
    () => AuthRespoitory(
      baseAuthRemoteDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  // Use cases

  locator.registerLazySingleton(
      () => GetPostsUseCase(baseAuthRepository: locator()));
  locator.registerLazySingleton(
      () => GetPostDetailsUseCase(baseAuthRepository: locator()));
  locator.registerLazySingleton(
      () => DeletePostUseCase(baseAuthRepository: locator()));
  locator.registerLazySingleton(
      () => GetCommentsUseCase(baseAuthRepository: locator()));

  ///--------------------------- SERVICES --------------------------------------

  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: Get.find(),
    ),
  );
}
