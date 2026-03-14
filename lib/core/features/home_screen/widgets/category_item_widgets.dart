import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidgets extends StatelessWidget {
  const CategoryItemWidgets({super.key, required this.CategoryName, this.onTap,   this.isSelected = false});
  final String CategoryName;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 8.0.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          decoration: BoxDecoration(
            color:  isSelected ? AppColors.primaryColor : Colors.transparent,
            border: isSelected ? null : Border.all(color: Colors.grey, width: 0.7),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(CategoryName, style: AppStyles.black15BoldStyle.copyWith(
            color: isSelected ? Colors.white : Colors.black
          )),
        ),
      ),
    );
  }
}
