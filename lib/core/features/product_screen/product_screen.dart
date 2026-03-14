import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/features/cart/cubit/card_cubit.dart';
import 'package:e_commerce_app/core/features/cart/cubit/cart_state.dart';
import 'package:e_commerce_app/core/features/home_screen/models/products_model.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/utils/animated_snack_bar.dart';
import 'package:e_commerce_app/core/widgets/primay_button_widget.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpace(20),
                    Container(
                      height: 341.h,
                      width: 341.w,
                      child: Hero(
                                      tag: "produt${productsModel.title} " ,

                        child: CachedNetworkImage(imageUrl: productsModel.image)),
                    ),
                    HeightSpace(12),
                    Text(
                      productsModel.title,
                      style: AppStyles.black18BoldStyle,
                    ),
                    HeightSpace(12),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        WidthSpace(3),
                        Text(
                          " ${productsModel.rating.rate}/5",
                          style: AppStyles.black15BoldStyle.copyWith(
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        WidthSpace(4),
                        Text(
                          "( ${productsModel.rating.count} reviews)",
                          style: AppStyles.grey12MediumStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    HeightSpace(12),
                    Text(
                      productsModel.description,
                      style: AppStyles.grey12MediumStyle.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    HeightSpace(40),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,

              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Price",
                                style: AppStyles.grey12MediumStyle.copyWith(
                                  fontSize: 15.sp,
                                ),
                              ),

                              Text(
                                "\$ ${productsModel.price}",
                                style: AppStyles.black15BoldStyle.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              HeightSpace(4),
                            ],
                          ),

                          BlocConsumer<CardCubit, CartState>(
                            listener: (context, state) {
                              if (state is SuccessAddingToCartState) {
                                showAnimatedSnackBar(
                                  context,
                                  type: AnimatedSnackBarType.success,
                                  message:" added to cart successfully",   
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is AddingToCartState) {
                                return PrimayButtonWidget(
                                  buttonText: "Add to Cart",
                                  onPress: () {},
                                  isLoading: true,
                                  height: 49.h,
                                  width: 240.w,
                                );
                              }
                              return PrimayButtonWidget(
                                icons: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                                buttonText: "Add to Cart",
                                onPress: () {
                                  context.read<CardCubit>().AddingToCart(
                                    product: productsModel,
                                    quantity: 1,
                                  );
                                },
                                height: 49.h,
                                width: 240.w,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    HeightSpace(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
