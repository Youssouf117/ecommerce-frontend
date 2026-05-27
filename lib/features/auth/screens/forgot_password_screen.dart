import 'package:ecommerce_mobile/core/widgets/custom_button.dart';
import 'package:ecommerce_mobile/core/widgets/custom_textfield.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFFD22922);
const darkColor = Color(0xFF6F1A2A);
const background = Color(0xFFFDFDFD);

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
  TextEditingController();

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
              painter: AfricanPatternPainter(),
              size: Size.infinite,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),

                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logo.jpg',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
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
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: darkColor,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(
                              offset: const Offset(1, 1),
                              blurRadius: 3,
                              color: primaryColor.withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Réinitialisez votre mot de passe",
                        style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),

                      const SizedBox(height: 40),

                      Text(
                        "Entrez votre adresse email pour recevoir un lien de réinitialisation.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: darkColor.withOpacity(0.7),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 35),

                      CustomTextField(
                        keyboardType:
                        TextInputType.emailAddress,
                        hintText: "Email",
                        controller: emailController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty) {
                            return "Email obligatoire";
                          }

                          if (!value.contains('@')) {
                            return "Email invalide";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 35),

                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              primaryColor,
                              darkColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius:
                          BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.4),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!
                                .validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Lien envoyé",
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Colors.transparent,
                            shadowColor:
                            Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "ENVOYER",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: primaryColor
                                  .withOpacity(0.3),
                              thickness: 1,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Text(
                              "OU",
                              style: TextStyle(
                                color: darkColor
                                    .withOpacity(0.6),
                                fontWeight:
                                FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),

                          Expanded(
                            child: Divider(
                              color: primaryColor
                                  .withOpacity(0.3),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: List.generate(
                          5,
                              (index) => Padding(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor
                                    .withOpacity(
                                  0.3 + index * 0.15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          Text(
                            "Retour à la connexion ? ",
                            style: TextStyle(
                              color:
                              darkColor.withOpacity(0.8),
                              fontSize: 15,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.login,
                              );
                            },
                            child: const Text(
                              "Se connecter",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 16,
                                decoration:
                                TextDecoration.underline,
                                decorationColor:
                                primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
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
  @override
  void paint(Canvas canvas, Size size) {
    final paintDiamond = Paint()
      ..color =
      const Color(0xFFD22922).withOpacity(0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paintWave = Paint()
      ..color =
      const Color(0xFF6F1A2A).withOpacity(0.03)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    for (int i = 0; i < 40; i++) {
      final path = Path();

      final x = (i * 45.0) % size.width;
      final y = (i * 35.0) % size.height;

      path.moveTo(x, y);
      path.lineTo(x + 15, y - 15);
      path.lineTo(x + 30, y);
      path.lineTo(x + 15, y + 15);
      path.close();

      canvas.drawPath(path, paintDiamond);
    }

    for (int i = 0; i < 20; i++) {
      final path = Path();

      final startY = i * 70.0;

      path.moveTo(0, startY);

      for (double x = 0;
      x < size.width;
      x += 30) {
        path.quadraticBezierTo(
          x + 15,
          startY + (x % 60 == 0 ? 20 : -20),
          x + 30,
          startY,
        );
      }

      canvas.drawPath(path, paintWave);
    }

    final paintDot = Paint()
      ..color =
      const Color(0xFFD22922).withOpacity(0.06)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 100; i++) {
      final x = (i * 37.5) % size.width;
      final y = (i * 23.3) % size.height;

      canvas.drawCircle(
        Offset(x, y),
        3,
        paintDot,
      );
    }
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate,
      ) {
    return false;
  }
}