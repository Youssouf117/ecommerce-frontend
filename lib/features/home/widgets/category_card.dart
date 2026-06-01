import 'package:flutter/material.dart';

const primaryColor = Color(0xFFD22922);
const darkColor = Color(0xFF6F1A2A);

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(
          right: 15,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20),
          border: Border.all(
            color:
                primaryColor.withOpacity(0.2),
            width: 1,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              primaryColor.withOpacity(0.05),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient:
                    const LinearGradient(
                  colors: [
                    primaryColor,
                    darkColor,
                  ],
                  begin:
                      Alignment.topLeft,
                  end: Alignment
                      .bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor
                        .withOpacity(0.3),
                    blurRadius: 8,
                    offset:
                        const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow:
                  TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight:
                    FontWeight.w600,
                color: darkColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}