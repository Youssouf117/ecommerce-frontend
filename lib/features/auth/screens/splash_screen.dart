import 'dart:async';

import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{

  void startSplash() {
    Timer(
        Duration(seconds: 3),
            () {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
    );
  }

  @override
  void initState() {
    super.initState();
    startSplash();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 100,
            ),

            SizedBox(height: 20,),

            Text(
              "Tima's Boutique",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 30,),

            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}