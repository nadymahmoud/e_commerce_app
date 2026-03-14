import 'package:e_commerce_app/core/features/account/widgets/account_items_widget.dart';
import 'package:e_commerce_app/core/features/address/widgets/address_item_widget.dart';
import 'package:e_commerce_app/core/styling/app_assets.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Container(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            Text("Saved Address", style: AppStyles.black16w500Style),
            HeightSpace(24),
            Expanded(
              child: ListView(
                children: [
                  AddressItemWidget(
                    address: "Home",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: "Work",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: "Home",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: "Home",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  AddressItemWidget(
                    address: "Home",
                    addressDetails: "925 S Chugach St #APT 10, Alas...",
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
