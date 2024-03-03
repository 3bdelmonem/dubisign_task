import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: SizedBox(
          width: 40.w,
          height: 40.h,
          child: const CircularProgressIndicator(strokeWidth: 7, color: purple2, backgroundColor: purple1,)
        ),
      ),
    );
  }
}
