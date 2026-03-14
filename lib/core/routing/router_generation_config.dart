import 'package:e_commerce_app/core/features/address/address_screen.dart';
import 'package:e_commerce_app/core/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/core/features/auth/login_screen.dart';
import 'package:e_commerce_app/core/features/auth/register_screen.dart';
import 'package:e_commerce_app/core/features/cart/cubit/card_cubit.dart';
import 'package:e_commerce_app/core/features/cart/repo/cart_repo.dart';
import 'package:e_commerce_app/core/features/home_screen/models/products_model.dart';
import 'package:e_commerce_app/core/features/main_screen/main_screen.dart';
import 'package:e_commerce_app/core/features/product_screen/product_screen.dart';
import 'package:e_commerce_app/core/features/splash_screen/splash_screen.dart';
import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes. splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        name: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
       GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.mainScreen,
        name: AppRoutes.mainScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<CardCubit>(),
          child: const MainScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.productScreen,
        name: AppRoutes.productScreen,
        builder: (context, state) {
          final product = state.extra as ProductsModel;
          return BlocProvider(
          create: (context) => sl<CardCubit>(),
            child: ProductScreen(productsModel: product),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.addressScreen,
        name: AppRoutes.addressScreen,
        builder: (context, state) => const AddressScreen(),
      ),
    ],
  );
}
