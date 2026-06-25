import 'package:flutter/material.dart';

import 'shopkeeper_dashboard_screen.dart';
import 'shopkeeper_products_screen.dart';
import 'shopkeeper_shops_screen.dart';
import 'shopkeeper_profile_screen.dart';

class ShopkeeperMainScreen extends StatefulWidget {
  const ShopkeeperMainScreen({super.key});

  @override
  State<ShopkeeperMainScreen> createState() =>
      _ShopkeeperMainScreenState();
}

class _ShopkeeperMainScreenState
    extends State<ShopkeeperMainScreen> {

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ShopkeeperDashboardScreen(),
    const ShopkeeperProductsScreen(),
    const ShopkeeperShopsScreen(),
    const ShopkeeperProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: "Produits",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Boutiques",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}