import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app/app_inj.dart';
import 'core/app/app_repository.dart';
import 'core/app/app_storage.dart';
import 'core/util/api_basehelper.dart';
import 'core/util/app_navigator.dart';
import 'features/home/home_inj.dart';

final sl = GetIt.instance;
final ApiBaseHelper helper = ApiBaseHelper();
Future<void> init() async {
  initAppMainjection(sl);
  initHomeinjection(sl);
  // core
  sl.registerLazySingleton<AppNavigator>(() => AppNavigator());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppRepository(KeyValueStorage(sharedPreferences)));
  helper.dioInit(Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      baseUrl: ApiBaseHelper.baseUrl,
      headers: {
        "Content-Type": 'application/json',
        "app-type": "client",
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    ),
  ));
  sl.registerLazySingleton(() => helper);
}