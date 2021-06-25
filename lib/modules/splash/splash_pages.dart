import 'package:flutter/material.dart';
import 'package:payflowprevious/shared/auth/auth_controller.dart';
import 'package:payflowprevious/shared/themes/app_colors.dart';
import 'package:payflowprevious/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    authController.currentUser(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.union)),
          Center(child: Image.asset(AppImages.logoFull))
        ],
      ),
    );
  }
}
