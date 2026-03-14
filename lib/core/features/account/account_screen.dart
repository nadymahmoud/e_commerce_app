import 'package:e_commerce_app/core/features/account/widgets/account_items_widget.dart';
import 'package:e_commerce_app/core/features/cart/widgets/cart_item_widget.dart';
import 'package:e_commerce_app/core/features/cart/widgets/title_price_widget.dart';
import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_assets.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/core/utils/storage_helper.dart';
import 'package:e_commerce_app/core/widgets/primay_button_widget.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Container(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(),
          ),
          const HeightSpace(8),
          AccountItemsWidget(
            onPress: () {},
            title: "My Orders",
            imagePath: AppAssets.box,
          ),
          const HeightSpace(8),
          Divider(color: Colors.grey.shade300, thickness: 8),
          const HeightSpace(12),
          AccountItemsWidget(
            onPress: () {},
            title: "My Details",
            imagePath: AppAssets.details,
          ),
          const HeightSpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(),
          ),
          const HeightSpace(8),

          AccountItemsWidget(
            onPress: () {
              context.pushNamed(AppRoutes.addressScreen);
            },
            title: "Address Book",
            imagePath: AppAssets.address,
          ),
          const HeightSpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(),
          ),
          const HeightSpace(8),

          AccountItemsWidget(
            onPress: () {},
            title: "FAQs",
            imagePath: AppAssets.question,
          ),
          const HeightSpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(),
          ),
          const HeightSpace(8),

          AccountItemsWidget(
            onPress: () {},
            title: "Help Center",
            imagePath: AppAssets.headphones,
          ),
          const HeightSpace(8),

          Divider(color: Colors.grey.shade300, thickness: 8),
          Spacer(),
          InkWell(
            onTap: () {
              showLogoutDialog(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
              child: Row(
                children: [
                  Image.asset(AppAssets.logout, height: 24.h, width: 24.w),
                  WidthSpace(8.w),
                  Text(
                    "Logout",
                    style: AppStyles.black15BoldStyle.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const HeightSpace(20),
        ],
      ),
    );
  }
}

showLogoutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              sl<StorageHelper>().removeToken();
              context.pushReplacement(AppRoutes.loginScreen);
            },
            child: Text("Logout"),
          ),
        ],
      );
    },
  );
}
