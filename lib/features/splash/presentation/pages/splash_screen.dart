import 'package:dubisign_task/core/constant/lotties.dart';
import 'package:dubisign_task/core/util/app_navigator.dart';
import 'package:dubisign_task/features/home/presentation/pages/home_screen.dart';
import 'package:dubisign_task/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController lottieController;
  @override
  void initState() {
    super.initState();
    lottieController = AnimationController(vsync: this);
    lottieController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          sl<AppNavigator>().pushReplacement(screen: const HomeScreen());
        }
      }
    );
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300.w,
          child: Lottie.asset(
            splashLottie,
            controller: lottieController, 
            repeat: false,
            onLoaded: (composition) {
              lottieController.duration = const Duration(seconds: 3);
              lottieController.forward();
            }
          )
        ),
      ),
    );
  }
}