import 'package:flutter/material.dart';

const primaryColor = Color(0xFFD22922);
const darkColor = Color(0xFF6F1A2A);
const background = Color(0xFFFDFDFD);

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: primaryColor.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Search Icon avec style
          Container(
            margin: const EdgeInsets.only(left: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primaryColor, darkColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          // Champ de recherche
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Rechercher un produit...",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
              style: const TextStyle(
                fontSize: 14,
                color: darkColor,
              ),
              onSubmitted: (value) => onSearch(),
            ),
          ),

          // Bouton Filtre
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: onSearch,
              icon: const Icon(Icons.tune),
              color: primaryColor,
              iconSize: 22,
              splashRadius: 25,
              tooltip: "Filtrer",
            ),
          ),
        ],
      ),
    );
  }
}