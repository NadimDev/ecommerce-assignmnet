import 'package:assignment_project/app/app_theme_data.dart';
import 'package:assignment_project/app/controller_binder.dart';
import 'package:assignment_project/features/auth/ui/screens/sign_up_screen.dart';
import 'package:assignment_project/features/auth/ui/screens/sign_in_screen.dart';
import 'package:assignment_project/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:assignment_project/features/auth/ui/screens/splash_screen.dart';
import 'package:assignment_project/features/category/ui/screens/category_list_screen.dart';
import 'package:assignment_project/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:assignment_project/features/product/ui/screens/product_details_screen.dart';
import 'package:assignment_project/features/product/ui/screens/product_list_screen.dart';
import 'package:assignment_project/features/product/ui/screens/product_review_create_screen.dart';
import 'package:assignment_project/features/product/ui/screens/product_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == SignInScreen.name) {
          widget = const SignInScreen();
        } else if (settings.name == OtpVerificationScreen.name) {
          String email = settings.arguments as String;
          widget = OtpVerificationScreen(email: email);
        } else if (settings.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          Map<String, dynamic> args =
              settings.arguments as Map<String, dynamic>;
          widget = ProductListScreen(
            categoryName: args['categoryName'],
            categoryId: args['categoryId'],
          );
        } else if (settings.name == ProductDetailsScreen.name) {
          String productId = settings.arguments as String;
          widget = ProductDetailsScreen(productId: productId);
        } else if (settings.name == ProductReviewScreen.name) {
          widget = const ProductReviewScreen();
        } else if (settings.name == ProductReviewCreateScreen.name) {
          widget = const ProductReviewCreateScreen();
        }

        return MaterialPageRoute(
          builder: (ctx) {
            return widget;
          },
        );
      },
    );
  }
}
