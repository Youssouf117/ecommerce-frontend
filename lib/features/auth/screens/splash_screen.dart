import 'dart:async';
import 'package:ecommerce_mobile/core/services/storage_service.dart';
import 'package:ecommerce_mobile/features/auth/services/auth_service.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFFD22922);
const darkColor = Color(0xFF6F1A2A);
const background = Color(0xFFFDFDFD);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final AuthService authService = AuthService();
  final StorageService storageService = StorageService();

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;

  Future<void> startSplash() async {
    await Future.delayed(const Duration(seconds: 2));

    String? token = await storageService.getToken();

    if (token != null) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.main);
      }
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _controller.forward();
    startSplash();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Color color, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.5, end: 1),
      duration: Duration(milliseconds: 600 + (index * 200)),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.6),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dimensions responsives
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth >= 600;
    final isDesktop = screenWidth >= 1200;

    // Tailles responsives
    final logoSize = isDesktop ? 220.0 : (isTablet ? 200.0 : 180.0);
    final titleFontSize = isDesktop ? 44.0 : (isTablet ? 38.0 : 34.0);
    final subtitleFontSize = isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0);
    final dotSize = isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0);
    final spacing = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [background, Color(0xFFFFF5F0), background],
              ),
            ),
            child: CustomPaint(
              painter: AfricanPatternPainter(primaryColor, darkColor, screenWidth),
              size: Size.infinite,
            ),
          ),

          FadeTransition(
            opacity: _fade,
            child: ScaleTransition(
              scale: _scale,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Container(
                        width: logoSize,
                        height: logoSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.4),
                              blurRadius: 25,
                              spreadRadius: 8,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/images/logo.jpg',
                                width: logoSize,
                                height: logoSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.03),

                      // Ligne décorative
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: spacing,
                            height: 2,
                            color: primaryColor.withOpacity(0.5),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Container(
                            width: dotSize * 0.6,
                            height: dotSize * 0.6,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Container(
                            width: spacing,
                            height: 2,
                            color: primaryColor.withOpacity(0.5),
                          ),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      // Titre
                      Text(
                        "MAISON KANDARA",
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: darkColor,
                          letterSpacing: 3,
                          shadows: [
                            Shadow(
                              offset: const Offset(2, 2),
                              blurRadius: 6,
                              color: primaryColor.withOpacity(0.3),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: screenHeight * 0.015),

                      // Étoile
                      Icon(
                        Icons.star,
                        color: primaryColor,
                        size: screenWidth * 0.05,
                      ),

                      SizedBox(height: screenHeight * 0.015),

                      // Sous-titre
                      Text(
                        "✿ Excellence & Authenticité ✿",
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          color: darkColor.withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.08),

                      // Points de chargement
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(primaryColor, 0),
                          SizedBox(width: screenWidth * 0.04),
                          _buildDot(primaryColor, 1),
                          SizedBox(width: screenWidth * 0.04),
                          _buildDot(primaryColor, 2),
                        ],
                      ),

                      SizedBox(height: screenHeight * 0.04),

                      // Petit motif en bas
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          isDesktop ? 7 : (isTablet ? 6 : 5),
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                            child: Container(
                              width: dotSize * 0.5,
                              height: dotSize * 0.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor.withOpacity(0.3 + index * 0.1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AfricanPatternPainter extends CustomPainter {
  final Color primaryColor;
  final Color darkColor;
  final double screenWidth;

  AfricanPatternPainter(this.primaryColor, this.darkColor, this.screenWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final scale = (screenWidth / 400).clamp(0.6, 1.5);
    final diamondSize = 15.0 * scale;
    final waveSpacing = 80.0 * scale;
    final dotRadius = 2.5 * scale;

    final paint = Paint()
      ..color = primaryColor.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0 * scale;

    // Motifs diamants
    for (int i = 0; i < 20; i++) {
      final path = Path();
      final startX = (i * 50.0 * scale) % size.width;
      final startY = (i * 30.0 * scale) % size.height;

      path.moveTo(startX, startY);
      path.lineTo(startX + diamondSize, startY - diamondSize);
      path.lineTo(startX + diamondSize * 2, startY);
      path.lineTo(startX + diamondSize, startY + diamondSize);
      path.close();

      canvas.drawPath(path, paint);
    }

    // Lignes ondulées
    final wavePaint = Paint()
      ..color = darkColor.withOpacity(0.03)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0 * scale;

    for (int i = 0; i < 10; i++) {
      final path = Path();
      final y = i * waveSpacing;

      path.moveTo(0, y);
      for (double x = 0; x < size.width; x += 20 * scale) {
        path.quadraticBezierTo(
          x + 10 * scale,
          y + ((x % (40 * scale)) == 0 ? 15 * scale : -15 * scale),
          x + 20 * scale,
          y,
        );
      }
      canvas.drawPath(path, wavePaint);
    }

    // Points décoratifs
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