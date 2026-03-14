import 'package:e_commerce_app/core/features/account/widgets/loading_widget.dart';
import 'package:e_commerce_app/core/features/home_screen/cubit/categories_cubit.dart';
import 'package:e_commerce_app/core/features/home_screen/cubit/categories_state.dart';
import 'package:e_commerce_app/core/features/home_screen/cubit/product_cubit.dart';
import 'package:e_commerce_app/core/features/home_screen/cubit/product_state.dart';
import 'package:e_commerce_app/core/features/home_screen/models/products_model.dart';
import 'package:e_commerce_app/core/features/home_screen/widgets/category_item_widgets.dart';
import 'package:e_commerce_app/core/features/home_screen/widgets/product_item_widget.dart';
import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CategoriesCubit>().fetchCategories();
    context.read<ProductCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(14),
          SizedBox(
            width: 330.w,
            child: Text("Discover", style: AppStyles.primaryHeadLinesStyle),
          ),
          HeightSpace(14.h),
          Row(
            children: [
              CustomTextField(width: 280.w, hintText: "Search for clothes..."),
              WidthSpace(8.w),
              Container(
                height: 52.h,
                width: 52.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ],
          ),
          HeightSpace(14.h),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is SuccessCategoriesState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.categories.map((e) {
                      return CategoryItemWidgets(
                        isSelected: selectedCategory == e ? true : false,
                        onTap: () {
                          setState(() {
                            selectedCategory = e;
                            if (selectedCategory == "All") {
                              context.read<ProductCubit>().fetchProducts();
                            } else {
                              context
                                  .read<ProductCubit>()
                                  .fetchProductsCategories(e);
                            }
                          });
                        },
                        CategoryName: e,
                      );
                    }).toList(),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          HeightSpace(14.h),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is LoadingProductState) {
                return Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,

                    child: GridView.builder(
                      itemCount: 6  ,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          width: 83.w,
                          height: 79.h,
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 8.h,
                        childAspectRatio: 0.8,
                      ),
                    ),
                  ),
                );
              }
              if (state is SuccessProductState) {
                List<ProductsModel> products = state.productsModel;
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      selectedCategory = 'All';
                      setState(() {});
                      context.read<ProductCubit>().fetchProducts();
                    },
                    child: AnimationLimiter(
                      child: GridView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: ProductItemWidget(
                                  image: products[index].image,
                                  title: products[index].title,
                                  price: products[index].price.toString(),
                                  onTap: () {
                                    context.pushNamed(
                                      AppRoutes.productScreen,
                                      extra: products[index],
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 8.h,
                          childAspectRatio: 0.65,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const Text("Something went wrong");
            },
          ),
        ],
      ),
    );
  }
}
