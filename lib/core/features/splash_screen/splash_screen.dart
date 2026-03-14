import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_assets.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/core/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    waitingAnimationAndNavigate();
  }

  waitingAnimationAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    sl<StorageHelper>().getToken().then(
      (token) => token != null && token.isNotEmpty
          ? context.pushReplacementNamed(AppRoutes.mainScreen)
          : context.pushReplacementNamed(AppRoutes.loginScreen),
    );
  }

  @override
  void dispose() {
        animationController.dispose();

    // TODO: implement dispose
    super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(AppAssets.logo, width: 200.w, height: 200.h),
        ),
      ),
    );
  }
}
