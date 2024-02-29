import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:dubisign_task/core/constant/icons.dart';
import 'package:dubisign_task/core/constant/styles/styles.dart';
import 'package:dubisign_task/core/util/app_navigator.dart';
import 'package:dubisign_task/core/widgets/custom_button.dart';
import 'package:dubisign_task/injection_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

aleartDialog(Function() delete, BuildContext context){
  Dialog alert = Dialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 25.h , horizontal: 35.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(15.r)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightRed
                ),
                child: SvgPicture.asset(
                  trashIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Text(
                  "delete".tr(),
                  style: TextStyles.textViewMeduim16.copyWith(color: grey11),
                ),
              ),
              Text(
                "deleteMessage".tr(),
                style: TextStyles.textViewRegular12.copyWith(color: grey5),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    width: 85.w,
                    heigh: 30.h,
                    gradient: gradient,
                    onPressed: delete,
                    child: Text(
                      "ok".tr(),
                      style: TextStyles.textViewMeduim13.copyWith(color: white),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  AppButton(
                    width: 75.w,
                    heigh: 30.h,
                    color: grey4,
                    onPressed: () => sl<AppNavigator>().pop(),
                    child: Text(
                      "skip".tr(),
                      style: TextStyles.textViewMeduim13.copyWith(color: grey10),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
  
  showDialog(
    barrierDismissible: false,
    context: context,
    barrierColor: black.withOpacity(0.6),
    builder:(BuildContext context) => alert
  );
}
