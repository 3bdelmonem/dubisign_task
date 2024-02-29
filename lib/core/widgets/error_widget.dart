import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:dubisign_task/core/constant/lotties.dart';
import 'package:dubisign_task/core/constant/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  const AppErrorWidget({required this.message, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 400.h,
          child: Lottie.asset(errorLottie, fit: BoxFit.contain)
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
          child: Text(
            message,
            style: TextStyles.textViewMeduim16.copyWith(color: red),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}