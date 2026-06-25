import 'package:flutter/material.dart';

import 'admin_dashboard_screen.dart';
import 'admin_categories_screen.dart';
import 'admin_products_screen.dart';
import 'admin_shops_screen.dart';
import 'admin_profile_screen.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() =>
      _AdminMainScreenState();
}

class _AdminMainScreenState
    extends State<AdminMainScreen> {

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const AdminDashboardScreen(),
    const AdminCategoriesScreen(),
    const AdminProductsScreen(),
    const AdminShopsScreen(),
    const AdminProfileScreen(),
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
            icon: Icon(Icons.category),
            label: "Catégories",
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