import 'package:e_commerce_app/core/styling/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height,
      width: width ?? MediaQuery.of(context).size.width,
      child: Center(
        child: LottieBuilder.asset(
          AppAssets.loadingLottie,
          height: 200.h,
          width: 200.w,
        ),
      ),
    );
  }
}
