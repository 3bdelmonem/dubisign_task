import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:dubisign_task/core/constant/icons.dart';
import 'package:dubisign_task/core/constant/styles/styles.dart';
import 'package:dubisign_task/core/widgets/outline_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsersListview extends StatelessWidget {
  final bool isFriend;
  final String image;
  final String name;
  final String email;
  final Function()? onTap;
  
  const UsersListview({
    required this.isFriend,
    required this.image,
    required this.name,
    required this.email,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsetsDirectional.only(bottom: 15.w, start: 15.w, end: 15.w),
      padding: EdgeInsets.all(10.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isFriend ? lightRed : lightBlue,
        borderRadius: BorderRadius.circular(12.r)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 60.w,
                height: 60.h,
                child: GradientOutlineBorder(
                  radius: 15.r,
                  gradient: gradient,
                  child: Container(
                    margin: EdgeInsetsDirectional.all(5.r),
                    alignment: Alignment.center,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12.r)
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    )
                  )
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.textViewMeduim16.copyWith(color: grey11),
                  ),
                  Text(
                    email,
                    style: TextStyles.textViewMeduim10.copyWith(color: grey8),
                  )
                ],
              )
            ],
          ),
          InkWell(
            onTap: onTap,
            child: SvgPicture.asset(
              isFriend == true ? trashIcon : addIcon,
              width: 20.w,
              height: 20.h,
            ),
          )
        ],
      ),
    );
  }
}