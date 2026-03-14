import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    this.onTap,
  });
  final String title;
  final String price;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Hero(
              tag: "produt$title" ,
              child: CachedNetworkImage(  imageUrl: image, height: 180.h, width: 180.w, fit: BoxFit.cover,)),
          ),
          HeightSpace(8.h),
          Text(title, style: AppStyles.black15BoldStyle , maxLines: 1,),
          HeightSpace(8.h),
          Text(price, style: AppStyles.grey12MediumStyle),
        ],
      ),
    );
  }
}
