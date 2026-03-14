import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressItemWidget extends StatelessWidget {
  const AddressItemWidget({
    super.key,
    required this.address,
    required this.addressDetails,
  });
  final String address;
  final String addressDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: EdgeInsets.all(16.0.sp),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.7),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey, size: 24.sp),

            const WidthSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address, style: AppStyles.black15BoldStyle),
                Text(addressDetails, style: AppStyles.grey12MediumStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
