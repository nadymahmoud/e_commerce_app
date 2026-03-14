import 'package:e_commerce_app/core/features/account/widgets/loading_widget.dart';
import 'package:e_commerce_app/core/features/cart/cubit/card_cubit.dart';
import 'package:e_commerce_app/core/features/cart/cubit/cart_state.dart';
import 'package:e_commerce_app/core/features/cart/widgets/cart_item_widget.dart';
import 'package:e_commerce_app/core/features/cart/widgets/title_price_widget.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/primay_button_widget.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Container(),
      ),
      body: BlocBuilder<CardCubit, CartState>(
        builder: (context, state) {
          if (state is LoadingCartState) {
            return Center(
              child: LoadingWidget(height: 200.h, width: 200.w),
            );
          }
          if (state is SuccessCartState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpace(20),
                    ...state.cartModel.products!
                        .map((e) => CartItemWidget(product: e))
                        .toList(),
                    const HeightSpace(16),
                    const TitlePriceWidget(title: "Sub-total", price: "200 \$"),
                    const TitlePriceWidget(title: "VAT (%)", price: "20 \$"),
                    const TitlePriceWidget(
                      title: "Shipping fee",
                      price: "220 \$",
                    ),
                    const HeightSpace(16),
                    Divider(),
                    const HeightSpace(16),
                    TotalPriceWidget(title: "Total ", price: "600 \$ "),
                    const HeightSpace(16),
                    PrimayButtonWidget(
                      buttonText: "Go To Checkout",
                      onPress: () {},
                      trailingIcons: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 17.sp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
