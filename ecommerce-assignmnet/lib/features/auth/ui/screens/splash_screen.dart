import 'package:assignment_project/features/auth/ui/screens/sign_in_screen.dart';
import 'package:assignment_project/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:assignment_project/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/ui/screens/main_bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
     Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    // Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogoWidget(),
              Spacer(),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
