import 'package:ecommerce_mobile/features/auth/screens/forgot_password_screen.dart';
import 'package:ecommerce_mobile/features/auth/screens/login_screen.dart';
import 'package:ecommerce_mobile/features/auth/screens/register_screen.dart';
import 'package:ecommerce_mobile/features/auth/screens/splash_screen.dart';
import 'package:ecommerce_mobile/features/home/screens/home_screen.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.splash:(context) => const SplashScreen(),

        AppRoutes.home:(context) =>const HomeScreen(),

        AppRoutes.forgotPassword:(context) =>ForgotPasswordScreen(),

        AppRoutes.register:(context) => const RegisterScreen(),

        AppRoutes.login:(context) => const LoginScreen(),

      },
    );
  }
}