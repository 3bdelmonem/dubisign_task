import 'package:dubisign_task/bloc/app_cubit/app_cubit.dart';
import 'package:dubisign_task/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> initAppMainjection(GetIt sl) async {
  // cubit
  sl.registerFactory<AppCubit>(() => AppCubit(repository: sl()));
}

List<BlocProvider> appMainBlocs(BuildContext context) => [
  BlocProvider<AppCubit>(create: (BuildContext context) => sl<AppCubit>()),
];