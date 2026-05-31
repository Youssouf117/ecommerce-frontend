import 'package:ecommerce_mobile/features/cart/screens/cart_screen.dart';
import 'package:ecommerce_mobile/features/home/screens/home_screen.dart';
import 'package:ecommerce_mobile/features/order/screens/order_screen.dart';
import 'package:ecommerce_mobile/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFFD22922);
const darkColor = Color(0xFF6F1A2A);
const background = Color(0xFFFDFDFD);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    const OrderScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: background,
          selectedItemColor: primaryColor,
          unselectedItemColor: darkColor.withOpacity(0.5),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isTablet ? 14 : 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: isTablet ? 14 : 12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 0 ? primaryColor.withOpacity(0.1) : Colors.transparent,
                ),
                child: Icon(
                  Icons.home,
                  size: isTablet ? 28 : 24,
                  color: currentIndex == 0 ? primaryColor : darkColor.withOpacity(0.5),
                ),
              ),
              label: "Accueil",
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 1 ? primaryColor.withOpacity(0.1) : Colors.transparent,
                ),
                child: Icon(
                  Icons.shopping_cart,
                  size: isTablet ? 28 : 24,
                  color: currentIndex == 1 ? primaryColor : darkColor.withOpacity(0.5),
                ),
              ),
              label: "Panier",
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 2 ? primaryColor.withOpacity(0.1) : Colors.transparent,
                ),
                child: Icon(
                  Icons.inventory,
                  size: isTablet ? 28 : 24,
                  color: currentIndex == 2 ? primaryColor : darkColor.withOpacity(0.5),
                ),
              ),
              label: "Commandes",
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 3 ? primaryColor.withOpacity(0.1) : Colors.transparent,
                ),
                child: Icon(
                  Icons.person,
                  size: isTablet ? 28 : 24,
                  color: currentIndex == 3 ? primaryColor : darkColor.withOpacity(0.5),
                ),
              ),
              label: "Profil",
            ),
          ],
        ),
      ),
    );
  }
}