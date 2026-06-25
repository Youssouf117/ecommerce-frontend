/*import 'package:ecommerce_mobile/core/services/storage_service.dart';
import 'package:ecommerce_mobile/features/home/widgets/category_card.dart';
import 'package:ecommerce_mobile/features/home/widgets/product_card.dart';
import 'package:ecommerce_mobile/features/home/widgets/search_bar_widget.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

   State<HomeScreen> createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen>{
  final TextEditingController searchController=TextEditingController();
  final StorageService storageService=StorageService();

  Future<void> logoutUser() async{
    await storageService.removeToken();

    Navigator.pushNamedAndRemoveUntil(context,AppRoutes.login, (route) => false);

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Maison Kandara"),
        actions: [
          IconButton(onPressed: logoutUser, icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search
            SearchBarWidget(controller: searchController, onSearch: () {}),

            SizedBox(height: 25,),

            //Categories
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 15,),

            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    title: "Electronique",
                    icon: Icons.phone_android,
                    onTap: () {},
                  ),
                  CategoryCard(
                    title: "Mode",
                    icon: Icons.shopping_bag,
                    onTap: () {},
                  ),
                  CategoryCard(
                    title: "Maison",
                    icon: Icons.chair,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 25,),

            const Text(

              "Produits populaires",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            SizedBox(height: 15,),

            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(
                    name: "Iphone 15",
                    imageUrl: "",
                    onTap: () {},
                    price: 85000,
                  ),
                  ProductCard(
                    name: "Nike",
                    imageUrl: "",
                    onTap: () {},
                    price: 30000,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}*/

import 'package:ecommerce_mobile/core/services/storage_service.dart';
import 'package:ecommerce_mobile/features/customer/widgets/category_card.dart';
import 'package:ecommerce_mobile/features/customer/widgets/product_card.dart';
import 'package:ecommerce_mobile/features/customer/widgets/search_bar_widget.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const primaryColor = Color(0xFFD22922);
const darkColor = Color(0xFF6F1A2A);
const background = Color(0xFFFDFDFD);
const goldColor = Color(0xFFFFD700);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final StorageService storageService = StorageService();

  Future<void> logoutUser() async {
    await storageService.removeToken();
    //await storageService.removeUserId();
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
    }
  }

  void showAddToCartSnackBar(String productName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text("$productName ajouté au panier"),
          ],
        ),
        backgroundColor: primaryColor,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  void copyPromoCode(String promoCode) {
    Clipboard.setData(ClipboardData(text: promoCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: const [
            Icon(Icons.copy, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text("Code promo copié !"),
          ],
        ),
        backgroundColor: primaryColor,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1200;

    final paddingHorizontal = screenWidth * 0.04;
    final spacing = screenWidth * 0.03;
    final categoryHeight = screenHeight * 0.18;
    final productHeight = screenHeight * 0.38;
    final titleFontSize = screenWidth * 0.06;
    final sectionFontSize = screenWidth * 0.05;
    final subtitleFontSize = screenWidth * 0.035;

    final int categoriesCount = 5;
    final int productsCount = isDesktop ? 6 : (isTablet ? 4 : 3);

    final List<Map<String, dynamic>> allProducts = [
      {"name": "iPhone 15 Pro", "price": 850000.0, "imageUrl": "https://picsum.photos/id/0/500/500"},
      {"name": "Nike Air Max", "price": 75000.0, "imageUrl": "https://picsum.photos/id/20/500/500"},
      {"name": "Boubou Sénégalais", "price": 45000.0, "imageUrl": "https://picsum.photos/id/30/500/500"},
      {"name": "Tissu Wax", "price": 12000.0, "imageUrl": "https://picsum.photos/id/29/500/500"},
      {"name": "Sac à main", "price": 35000.0, "imageUrl": "https://picsum.photos/id/26/500/500"},
      {"name": "Montre Connectée", "price": 120000.0, "imageUrl": "https://picsum.photos/id/82/500/500"},
    ];

    final List<Map<String, dynamic>> categories = [
      {"title": "Electro", "icon": Icons.phone_android},
      {"title": "Mode", "icon": Icons.shopping_bag},
      {"title": "Maison", "icon": Icons.chair},
      {"title": "Artisanat", "icon": Icons.brush},
      {"title": "Bijoux", "icon": Icons.diamond},
    ];

    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.12),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                background,
                const Color(0xFFFFF5F0),
                background,
              ],
            ),
            border: Border(
              bottom: BorderSide(
                color: primaryColor.withOpacity(0.15),
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: screenHeight * 0.015),
              child: Row(
                children: [
                  // Menu Icon
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: darkColor,
                        size: screenWidth * 0.055,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Logo / Titre
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Petite ligne décorative au-dessus
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                            height: 2,
                            color: primaryColor.withOpacity(0.5),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 20,
                            height: 2,
                            color: primaryColor.withOpacity(0.5),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // MAISON
                      Text(
                        "MAISON",
                        style: TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.5,
                          fontSize: screenWidth * 0.032,
                        ),
                      ),
                      // KANDARA
                      Text(
                        "KANDARA",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.5,
                          fontSize: screenWidth * 0.048,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Déconnexion
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: logoutUser,
                      icon: Icon(
                        Icons.logout,
                        size: screenWidth * 0.055,
                      ),
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  background,
                  const Color(0xFFFFF5F0),
                  background,
                ],
              ),
            ),
            child: CustomPaint(
              painter: HomePatternPainter(primaryColor, darkColor, screenWidth),
              size: Size.infinite,
            ),
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: screenHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bannière de bienvenue
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primaryColor, darkColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            blurRadius: screenWidth * 0.03,
                            offset: Offset(0, screenWidth * 0.01),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenue",
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "Découvrez nos produits exclusifs",
                            style: TextStyle(
                              fontSize: subtitleFontSize,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // BANNIÈRE CODE PROMO - VERSION PREMIUM AMÉLIORÉE
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [goldColor, primaryColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        boxShadow: [
                          BoxShadow(
                            color: goldColor.withOpacity(0.4),
                            blurRadius: screenWidth * 0.02,
                            offset: Offset(0, screenWidth * 0.008),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Icône de fond décorative
                          Positioned(
                            right: -10,
                            top: -10,
                            child: Icon(
                              Icons.local_offer,
                              size: screenWidth * 0.15,
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            child: Row(
                              children: [
                                // Icône principale avec animation
                                Container(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.local_offer,
                                    color: primaryColor,
                                    size: screenWidth * 0.05,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.03),

                                // Texte du code promo
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "CODE PROMO EXCLUSIF",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white70,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            "KANDARA20",
                                            style: TextStyle(
                                              fontSize: sectionFontSize * 0.8,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              letterSpacing: 2,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black.withOpacity(0.2),
                                                  blurRadius: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 3,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              "-20%",
                                              style: TextStyle(
                                                fontSize: subtitleFontSize * 0.6,
                                                fontWeight: FontWeight.bold,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        "Sur votre première commande",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Bouton Copier stylisé
                                GestureDetector(
                                  onTap: () => copyPromoCode("KANDARA20"),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04,
                                      vertical: screenHeight * 0.012,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.15),
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.copy,
                                          size: screenWidth * 0.04,
                                          color: primaryColor,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          "COPIEZ",
                                          style: TextStyle(
                                            fontSize: subtitleFontSize * 0.65,
                                            fontWeight: FontWeight.bold,
                                            color: primaryColor,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Search Bar
                    SearchBarWidget(controller: searchController, onSearch: () {}),

                    SizedBox(height: screenHeight * 0.03),

                    // Titre Catégories
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.015,
                          height: screenHeight * 0.04,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          "CATÉGORIES",
                          style: TextStyle(
                            fontSize: sectionFontSize,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: darkColor,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Voir tout",
                            style: TextStyle(color: primaryColor, fontSize: subtitleFontSize),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Liste des catégories
                    SizedBox(
                      height: categoryHeight,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoriesCount,
                        itemBuilder: (context, index) {
                          final category = categories[index % categories.length];
                          return Padding(
                            padding: EdgeInsets.only(right: spacing),
                            child: CategoryCard(
                              title: category["title"] as String,
                              icon: category["icon"] as IconData,
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.04),

                    // Titre Produits populaires
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.015,
                          height: screenHeight * 0.04,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          "PRODUITS POPULAIRES",
                          style: TextStyle(
                            fontSize: sectionFontSize,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: darkColor,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Voir tout",
                            style: TextStyle(color: primaryColor, fontSize: subtitleFontSize),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Liste des produits
                    isDesktop
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: spacing,
                              mainAxisSpacing: spacing,
                            ),
                            itemCount: allProducts.length,
                            itemBuilder: (context, index) {
                              final product = allProducts[index];
                              return ProductCard(
                                name: product["name"] as String,
                                imageUrl: product["imageUrl"] as String,
                                onTap: () {},
                                onAddToCart: () {
                                  showAddToCartSnackBar(product["name"] as String);
                                },
                                price: product["price"] as double,
                              );
                            },
                          )
                        : SizedBox(
                            height: productHeight,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: productsCount,
                              itemBuilder: (context, index) {
                                final product = allProducts[index];
                                return Padding(
                                  padding: EdgeInsets.only(right: spacing),
                                  child: ProductCard(
                                    name: product["name"] as String,
                                    imageUrl: product["imageUrl"] as String,
                                    onTap: () {},
                                    onAddToCart: () {
                                      showAddToCartSnackBar(product["name"] as String);
                                    },
                                    price: product["price"] as double,
                                  ),
                                );
                              },
                            ),
                          ),

                    SizedBox(height: screenHeight * 0.03),

                    // Bannière promotionnelle
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [primaryColor, darkColor],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(screenWidth * 0.04),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            blurRadius: screenWidth * 0.03,
                            offset: Offset(0, screenWidth * 0.01),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.local_shipping,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Livraison Gratuite",
                                      style: TextStyle(
                                        fontSize: sectionFontSize * 0.8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  "Pour toute commande supérieure à 50 000 FCFA",
                                  style: TextStyle(
                                    fontSize: subtitleFontSize * 0.8,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.local_shipping,
                            color: Colors.white.withOpacity(0.3),
                            size: screenWidth * 0.1,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Painter pour le body
class HomePatternPainter extends CustomPainter {
  final Color primaryColor;
  final Color darkColor;
  final double screenWidth;

  HomePatternPainter(this.primaryColor, this.darkColor, this.screenWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final scale = (screenWidth / 400).clamp(0.6, 1.5);
    final diamondSize = 15.0 * scale;
    final waveSpacing = 70.0 * scale;
    final dotRadius = 2.5 * scale;

    final paintDiamond = Paint()
      ..color = primaryColor.withOpacity(0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0 * scale;

    final paintWave = Paint()
      ..color = darkColor.withOpacity(0.03)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5 * scale;

    for (int i = 0; i < 30; i++) {
      final path = Path();
      final x = (i * 45.0 * scale) % size.width;
      final y = (i * 35.0 * scale) % size.height;

      path.moveTo(x, y);
      path.lineTo(x + diamondSize, y - diamondSize);
      path.lineTo(x + diamondSize * 2, y);
      path.lineTo(x + diamondSize, y + diamondSize);
      path.close();

      canvas.drawPath(path, paintDiamond);
    }

    for (int i = 0; i < 15; i++) {
      final path = Path();
      final startY = i * waveSpacing;

      path.moveTo(0, startY);
      for (double x = 0; x < size.width; x += 30 * scale) {
        path.quadraticBezierTo(
          x + 15 * scale,
          startY + (x % (60 * scale) == 0 ? 20.0 * scale : -20.0 * scale),
          x + 30 * scale,
          startY,
        );
      }
      canvas.drawPath(path, paintWave);
    }

    final paintDot = Paint()
      ..color = primaryColor.withOpacity(0.06)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 80; i++) {
      final x = (i * 37.5 * scale) % size.width;
      final y = (i * 23.3 * scale) % size.height;
      canvas.drawCircle(Offset(x, y), dotRadius, paintDot);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}