import 'package:e_commerce_app/core/features/cart/models/card_model.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.7),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Container(
              height: 79.h,
              width: 83.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            WidthSpace(16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        " item    ${product.productId} ",
                        style: AppStyles.black15BoldStyle,
                      ),
                      Spacer(),
                      Icon(Icons.delete, color: Colors.redAccent, size: 20.sp),
                    ],
                  ),
                  HeightSpace(21),
                  Row(
                    children: [
                      Text(" \$ 1,190", style: AppStyles.grey12MediumStyle),
                      Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 22.h,
                              width: 22.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.7,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.black,
                                size: 16.sp,
                              ),
                            ),
                          ),
                          WidthSpace(8.w),
                          Text("1", style: AppStyles.black15BoldStyle),
                          WidthSpace(8.w),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 22.h,
                              width: 22.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.7,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
