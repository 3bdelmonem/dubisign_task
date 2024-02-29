import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final Gradient? gradient;
  final double? width;
  final double? heigh;
  const AppButton({required this.onPressed, required this.child, this.color, this.borderColor, this.gradient, this.width, this.heigh, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?? double.infinity,
      height: heigh ?? 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: borderColor?? transparent, width: 1.5.r, strokeAlign: BorderSide.strokeAlignInside),
        color: color,
        gradient: gradient
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: transparent,
          shadowColor: transparent,
          splashFactory: NoSplash.splashFactory,
          surfaceTintColor: transparent,
          alignment: Alignment.center,
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: child
      ),
    );
  }
}