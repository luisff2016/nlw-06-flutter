import 'package:flutter/material.dart';
import 'package:payflowprevious/shared/themes/app_colors.dart';

import 'modules/login/login_page.dart';
import 'modules/splash_pages.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      // home: SplashPage(),
      home: LoginPage(),
    );
  }
}
