import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:dubisign_task/core/constant/icons.dart';
import 'package:dubisign_task/core/constant/styles/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Search extends StatelessWidget {
  final TextEditingController searchController;
  const Search({required this.searchController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: TextField(
        controller: searchController,
        maxLines: 1,
        minLines: 1,
        cursorColor: black,
        style: TextStyles.textViewRegular14.copyWith(color: grey11),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: grey1,
          hintText: "search".tr(),
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.r),
            child: SvgPicture.asset(
              searchIcon,
              colorFilter: const ColorFilter.mode(grey9, BlendMode.srcIn),
              width: 16.w,
              height: 16.h,
            ),
          ),
          hintStyle: TextStyles.textViewRegular14.copyWith(color: grey6),
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide.none,
            borderRadius: BorderRadius.circular(7.r)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide.none,
            borderRadius: BorderRadius.circular(7.r)
          ),
        ),
      ),
    );
  }
}


