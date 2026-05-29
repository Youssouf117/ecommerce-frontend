import 'package:ecommerce_mobile/features/cart/screens/cart_screen.dart';
import 'package:ecommerce_mobile/features/home/screens/home_screen.dart';
import 'package:ecommerce_mobile/features/order/screens/order_screen.dart';
import 'package:ecommerce_mobile/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() =>_MainScreenState();
}


class _MainScreenState extends State<MainScreen>{
  int currentIndex=0;
  final List<Widget> pages=[
    const HomeScreen(),
    const CartScreen(),
    const OrderScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Acceuil"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Panier"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: "Commandes"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil"
          ),
        ],
      ),
    );
  }
}