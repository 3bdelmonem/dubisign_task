import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:dubisign_task/core/constant/icons.dart';
import 'package:dubisign_task/core/widgets/outline_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dubisign_task/core/widgets/cached_image.dart';

class StoriesListview extends StatelessWidget {
  final String? image;
  const StoriesListview({this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      margin: EdgeInsetsDirectional.only(end: 15.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: image == null ? grey3 : transparent,
        shape: BoxShape.circle
      ),
      child: image == null ? SvgPicture.asset(
        userIcon,
        width: 25.w,
        height: 25.h,
      ):
      GradientOutlineBorder(
        radius: 100.r,
        gradient: gradient,
        child: Container(
          margin: EdgeInsetsDirectional.all(5.r),
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: white,
            shape: BoxShape.circle
          ),
          child: CustomImageWidget(image: image!)
        )
      ),
    );
  }
}