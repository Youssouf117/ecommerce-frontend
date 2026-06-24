import 'package:ecommerce_mobile/app.dart';
import 'package:ecommerce_mobile/features/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child:const MyApp()
    )
  );
}
