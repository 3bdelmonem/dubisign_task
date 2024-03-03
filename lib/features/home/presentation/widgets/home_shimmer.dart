import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: purple1.withOpacity(0.15),
      highlightColor: purple2.withOpacity(0.15),
      child: Column(
        children: [
           SizedBox(height: 20.h),
           SizedBox(
            height: 60.h,
            child: ListView.builder(
              padding: EdgeInsetsDirectional.only(start: 15.w),
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount:  6,
              itemBuilder: (context, index) {
                return Container(
                  width: 60.w,
                  height: 60.h,
                  margin: EdgeInsetsDirectional.only(end: 15.w),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color:  grey3,
                    shape: BoxShape.circle
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Divider(color: grey2,thickness: 1.r,)
          ),
          Container(
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              color:  grey3,
              borderRadius: BorderRadius.circular(7.r)
            ),
          ),
          ListView.builder(
            padding: EdgeInsetsDirectional.only(top: 15.w),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                height: 80.h,
                margin: EdgeInsetsDirectional.only(bottom: 15.w, start: 15.w, end: 15.w),
                padding: EdgeInsets.all(10.r),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: grey3,
                  borderRadius: BorderRadius.circular(12.r)
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}