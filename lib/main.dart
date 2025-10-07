import 'package:drivers_tracking_app/ui/auth/login/login_screen.dart';
import 'package:drivers_tracking_app/ui/auth/signup/signup_screen.dart';
import 'package:drivers_tracking_app/utils/app_routes.dart';
import 'package:drivers_tracking_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.loginScreenRouteName,
          routes: {
            AppRoutes.loginScreenRouteName:(context)=>LoginScreen(),
            AppRoutes.signupScreenRouteName:(context)=>SignupScreen()
          },
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}