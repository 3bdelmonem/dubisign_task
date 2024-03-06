import 'package:cached_network_image/cached_network_image.dart';
import 'package:dubisign_task/core/constant/colors/app_colors.dart';
import 'package:dubisign_task/core/constant/lotties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomImageWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit fit;

  const CustomImageWidget({
    required this.image,
    this.height = double.infinity,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        width: 40.w,
        height: 40.h,
        child: Lottie.asset(imageLoadingLottie)
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error, color: red,),
    );
  }
}