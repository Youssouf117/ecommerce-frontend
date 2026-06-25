import 'dart:async';

import 'package:ecommerce_mobile/core/services/storage_service.dart';
import 'package:ecommerce_mobile/features/auth/providers/auth_provider.dart';
import 'package:ecommerce_mobile/features/auth/services/auth_service.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

const primaryColor = Color(0xFFD22922);
const darkColor = Color(0xFF6F1A2A);
const background = Color(0xFFFDFDFD);




class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  final AuthService authService=AuthService();
  final StorageService storageService=StorageService();

  //Design attributs
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;



  Future<void> startSplash() async {
    await Future.delayed(Duration(seconds: 2));

    //Verifier le token Jwt
    String? token =await storageService.getToken();
    print("Token: $token");

    if(token==null){
      Navigator.pushReplacementNamed(context,AppRoutes.login);
      return;
      //Navigator.pushReplacementNamed(context, AppRoutes.main);
    }

    if(JwtDecoder.isExpired(token)){
      print("Token est non valide");
      await storageService.removeToken();
      Navigator.pushReplacementNamed(context, AppRoutes.login);
      return;
    }
    
    print("Token valide");

    try{
      await context.read<AuthProvider>().loadCurrentUser();
      final authProvider=context.read<AuthProvider>();
      final user=authProvider.currentUser;
      switch(user?.role) {

        case "CLIENT":
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.main,
          );
          break;

        case "SELLER":
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.shopkeeperMain,
          );
          break;

        case "ADMIN":
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.adminMain,
          );
          break;

        default:
          await storageService.removeToken();

          Navigator.pushReplacementNamed(
            context,
            AppRoutes.login,
          );
      }
    } catch(e){
      await storageService.removeToken();

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.login,
      );
    }

}



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fade = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _scale = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
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
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
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
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  background,
                  Color(0xFFFFF5F0),
                  background,
                ],
              ),
            ),
            child: CustomPaint(
              painter: AfricanPatternPainter(
                primaryColor,
                darkColor,
              ),
              size: Size.infinite,
            ),
          ),

          FadeTransition(
            opacity: _fade,
            child: ScaleTransition(
              scale: _scale,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primaryColor,
                          width: 3,
                        ),
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
                              width: 180,
                              height: 180,
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

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 2,
                          color: primaryColor.withOpacity(0.5),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 40,
                          height: 2,
                          color: primaryColor.withOpacity(0.5),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "MAISON KANDARA",
                      style: TextStyle(
                        fontSize: 34,
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
                    ),

                    const SizedBox(height: 10),

                    const Icon(
                      Icons.star,
                      color: primaryColor,
                      size: 20,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "✿ Excellence & Authenticité ✿",
                      style: TextStyle(
                        fontSize: 12,
                        color: darkColor.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 50),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDot(primaryColor, 0),
                        const SizedBox(width: 15),
                        _buildDot(primaryColor, 1),
                        const SizedBox(width: 15),
                        _buildDot(primaryColor, 2),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                            (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor.withOpacity(
                                0.3 + index * 0.1,
                              ),
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
        ],
      ),
    );
  }
}




class AfricanPatternPainter extends CustomPainter {
  final Color primaryColor;
  final Color darkColor;

  AfricanPatternPainter(
      this.primaryColor,
      this.darkColor,
      );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primaryColor.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int i = 0; i < 20; i++) {
      final path = Path();

      final startX = (i * 50.0) % size.width;
      final startY = (i * 30.0) % size.height;

      path.moveTo(startX, startY);
      path.lineTo(startX + 15, startY - 15);
      path.lineTo(startX + 30, startY);
      path.lineTo(startX + 15, startY + 15);
      path.close();

      canvas.drawPath(path, paint);
    }

    final wavePaint = Paint()
      ..color = darkColor.withOpacity(0.03)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    for (int i = 0; i < 10; i++) {
      final path = Path();

      final y = i * 80.0;

      path.moveTo(0, y);

      for (double x = 0; x < size.width; x += 20) {
        path.quadraticBezierTo(
          x + 10,
          y + (x % 40 == 0 ? 15 : -15),
          x + 20,
          y,
        );
      }

      canvas.drawPath(path, wavePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}