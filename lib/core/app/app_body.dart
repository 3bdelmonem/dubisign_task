import 'package:dubisign_task/bloc/app_cubit/app_cubit.dart';
import 'package:dubisign_task/core/app/app_data.dart';
import 'package:dubisign_task/core/app/app_inj.dart';
import 'package:dubisign_task/core/theme/app_theme.dart';
import 'package:dubisign_task/core/util/api_basehelper.dart';
import 'package:dubisign_task/core/util/app_navigator.dart';
import 'package:dubisign_task/features/home/home_inj.dart';
import 'package:dubisign_task/features/home/presentation/pages/home_screen.dart';
import 'package:dubisign_task/features/splash/presentation/pages/splash_screen.dart';
import 'package:dubisign_task/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DubisignTaskAppBody extends StatelessWidget {
  const DubisignTaskAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...appMainBlocs(context),
        ...appHomeBlocs(context),
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final bloc = AppCubit(repository: sl());
          Widget currentPage;
          switch (bloc.appState) {
            case AppStates.notSeenTutorial:
              currentPage = const SplashScreen();
              break;
            case AppStates.authenticated:
              currentPage = const HomeScreen();
              break;
            default:
              currentPage = const SplashScreen();
          }
          rebuildAllChildren(context);
          sl<ApiBaseHelper>().updateLocalInHeaders(EasyLocalization.of(context)!.currentLocale!.languageCode);
          return ScreenUtilInit(
              designSize: const Size(390, 844),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (BuildContext context, Widget? child) {
                return MaterialApp(
                  title: 'Dog Drive',
                  debugShowCheckedModeBanner: false,
                  theme: appTheme,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  routes: const {},
                  navigatorKey: sl<AppNavigator>().navigatorKey,
                  home: Builder(builder: (context) {return currentPage;}),
                );
              });
        },
      ),
    );
  }
}

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }

  (context as Element).visitChildren(rebuild);
}
