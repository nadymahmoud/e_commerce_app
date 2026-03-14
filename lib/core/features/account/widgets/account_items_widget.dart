import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountItemsWidget extends StatelessWidget {
  const AccountItemsWidget({
    super.key,
    required this.title,
    required this.imagePath,
    this.onPress,
  });
  final String title;
  final String imagePath;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w , vertical: 8.h),
        child: Row(
          children: [
            Row(
              children: [
                Image.asset(imagePath, height: 24.h, width: 24.w),

                WidthSpace(8.w),
                Text(title, style: AppStyles.black15BoldStyle),
              ],
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16.sp),
          ],
        ),
      ),
    );
  }
}
