import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitlePriceWidget extends StatelessWidget {
  const TitlePriceWidget({super.key, required this.title, required this.price});
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.grey12MediumStyle.copyWith(fontSize: 16.sp),
          ),
          const Spacer(),
          Text(price, style: AppStyles.black15BoldStyle),
        ],
      ),
    );
  }
}

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key, required this.title, required this.price});
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.black15BoldStyle.copyWith(fontSize: 16.sp),
          ),
          const Spacer(),
          Text(
            price,
            style: AppStyles.grey12MediumStyle.copyWith(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
