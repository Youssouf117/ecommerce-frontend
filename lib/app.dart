
import 'package:ecommerce_mobile/features/admin/screens/admin_main_screen.dart';
import 'package:ecommerce_mobile/features/auth/screens/forgot_password_screen.dart';
import 'package:ecommerce_mobile/features/auth/screens/login_screen.dart';
import 'package:ecommerce_mobile/features/auth/screens/register_screen.dart';
import 'package:ecommerce_mobile/features/auth/screens/splash_screen.dart';
import 'package:ecommerce_mobile/features/customer/screens/home_screen.dart';
import 'package:ecommerce_mobile/features/customer/screens/main_screen.dart';
import 'package:ecommerce_mobile/features/shopkeeper/screens/shopkeeper_main_screen.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash:(context) => const SplashScreen(),

        AppRoutes.forgotPassword:(context) =>ForgotPasswordScreen(),

        AppRoutes.register:(context) => const RegisterScreen(),

        AppRoutes.login:(context) => const LoginScreen(),

        //customer

        AppRoutes.main:(context) => const MainScreen(),

        AppRoutes.home:(context) => HomeScreen(),


        //shopkeeper
        AppRoutes.shopkeeperMain:(context) => ShopkeeperMainScreen(),


        //admin
        AppRoutes.adminMain:(context) =>AdminMainScreen(),

      },
    );
  }
}