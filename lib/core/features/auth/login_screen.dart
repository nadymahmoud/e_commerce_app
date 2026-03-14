import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/core/features/account/widgets/loading_widget.dart';
import 'package:e_commerce_app/core/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/core/features/auth/cubit/auth_state.dart';
import 'package:e_commerce_app/core/features/auth/repo/auth_repo.dart';
import 'package:e_commerce_app/core/routing/app_routes.dart';
import 'package:e_commerce_app/core/styling/app_colors.dart';
import 'package:e_commerce_app/core/styling/app_styles.dart';
import 'package:e_commerce_app/core/utils/animated_snack_bar.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/core/utils/storage_helper.dart';
import 'package:e_commerce_app/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app/core/widgets/primay_button_widget.dart';
import 'package:e_commerce_app/core/widgets/spacing_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController userName;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();

    userName = TextEditingController();
    password = TextEditingController();
        sl<StorageHelper>().getToken().then( (token) => token != null && token.isNotEmpty ? context.pushReplacementNamed(AppRoutes.mainScreen) : null);

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoadingAuthState) {
              LoadingWidget();
            }
            if (state is ErrorAuthState) {
              showAnimatedSnackBar(
                context,
                type: AnimatedSnackBarType.error,
                message: state.message,
              );
            }
            if (state is SuccessAuthState) {
              showAnimatedSnackBar(
                context,
                type: AnimatedSnackBarType.success,
                message: "Login Success",
              );
              context.pushReplacementNamed(AppRoutes.mainScreen);
            }
          },
          builder: (context, state) {
            if (state is LoadingAuthState) {
              return const LoadingWidget();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeightSpace(28),
                    SizedBox(
                      width: 334.w,
                      child: Text(
                        "Login to your account",
                        style: AppStyles.primaryHeadLinesStyle,
                      ),
                    ),
                    const HeightSpace(8),
                    SizedBox(
                      width: 334.w,
                      child: Text(
                        "It’s great to see you again.",
                        style: AppStyles.grey12MediumStyle,
                      ),
                    ),
                    const HeightSpace(32),
                    Text("User Name", style: AppStyles.black15BoldStyle),
                    const HeightSpace(8),

                    CustomTextField(
                      controller: userName,
                      hintText: "Enter your email address",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Email";
                        }
                        return null;
                      },
                    ),
                    const HeightSpace(15),
                    Text("Password", style: AppStyles.black15BoldStyle),
                    const HeightSpace(8),
                    CustomTextField(
                      hintText: "Enter Your Password",
                      controller: password,
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: AppColors.greyColor,
                        size: 20.sp,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Password";
                        }
                        if (value.length < 6) {
                          return "Password must be at least  6 characters";
                        }
                        return null;
                      },
                    ),
                    const HeightSpace(55),

                    PrimayButtonWidget(
                      buttonText: "Sign In",
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            email: userName.text,
                            password: password.text,
                          );
                        } //    if (formKey.currentState!.validate()) {
                        //   GoRouter.of(context).pushNamed(AppRoutes.verifyOtpScreen);
                        //  }
                      },
                    ),
                    Spacer(),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRoutes.registerScreen);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: AppStyles.black15BoldStyle.copyWith(
                              color: AppColors.primaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: "Join",
                                style: AppStyles.black15BoldStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const HeightSpace(14),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
