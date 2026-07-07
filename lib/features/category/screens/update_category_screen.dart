import 'package:flutter/material.dart';

class UpdateCategoryScreen extends StatelessWidget {
  const UpdateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier une catégorie"),
      ),

      body: const Center(
        child: Text("Update Category"),
      ),
    );
  }
}