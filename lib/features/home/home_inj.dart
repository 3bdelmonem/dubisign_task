import 'package:dubisign_task/features/home/data/datasources/home_datasource.dart';
import 'package:dubisign_task/features/home/data/repositories/home_repository_imp.dart';
import 'package:dubisign_task/features/home/domain/repositories/home_repository.dart';
import 'package:dubisign_task/features/home/domain/usecases/get_users_usecase.dart';
import 'package:dubisign_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:dubisign_task/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> initHomeinjection(GetIt sl) async {
  //* cubit
  sl.registerFactory<HomeCubit>(() => HomeCubit(getUsersUseCase: sl()));

  // use cases
  sl.registerLazySingleton(() => GetUsersUseCase(homeRepository: sl()));

  //* Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(homeDataSource: sl(),));

  //* Data sources
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImp(apiBaseHelper: sl()),);
}

List<BlocProvider> appHomeBlocs(BuildContext context) => [
  BlocProvider<HomeCubit>(create: (BuildContext context) => sl<HomeCubit>()),
];
