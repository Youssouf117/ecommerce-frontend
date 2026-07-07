import 'package:ecommerce_mobile/features/auth/providers/auth_provider.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';






const primaryColor = Color(0xFFD22922);
const darkColor = Color(0xFF6F1A2A);
const background = Color(0xFFFDFDFD);
const goldColor = Color(0xFFFFD700);







class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}


class _AdminDashboardScreenState extends State<AdminDashboardScreen>{

  Future<void> logoutUser() async {
    await context.read<AuthProvider>().logout();
    final authProvider=context.read<AuthProvider>();
    final user=authProvider.currentUser;
    print('Dans logoutUser apres deconnexion ,on a: ${user}');
    print('Dans logoutUser apres deconnexion, id est : ${user?.id}');
    print('Dans logoutUser apres deconnexion, role est : ${user?.role}');
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context){
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
      body: Center(
        child: Text("Admin Dashboard"),
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