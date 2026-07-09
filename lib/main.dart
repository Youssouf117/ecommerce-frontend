import 'package:ecommerce_mobile/app.dart';
import 'package:ecommerce_mobile/features/address/providers/address_provider.dart';
import 'package:ecommerce_mobile/features/auth/providers/auth_provider.dart';
import 'package:ecommerce_mobile/features/category/providers/category_provider.dart';
import 'package:ecommerce_mobile/features/product/providers/product_provider.dart';
import 'package:ecommerce_mobile/features/shop/providers/shop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_)=> ShopProvider()),
      ],
      child:const MyApp()
    )
  );
}
