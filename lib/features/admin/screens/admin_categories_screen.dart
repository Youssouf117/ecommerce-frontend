import 'package:ecommerce_mobile/features/admin/widgets/category_card.dart';
import 'package:ecommerce_mobile/features/category/providers/category_provider.dart';
import 'package:ecommerce_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminCategoriesScreen extends StatefulWidget {
  const AdminCategoriesScreen({super.key});

  @override
  State<AdminCategoriesScreen> createState() =>
      _AdminCategoriesScreenState();
}

class _AdminCategoriesScreenState
    extends State<AdminCategoriesScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<CategoryProvider>().loadCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CategoryProvider>(
        builder: (context, provider, child) {

          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.categories.isEmpty) {
            return const Center(
              child: Text("Aucune catégorie"),
            );
          }

          return ListView.builder(
            itemCount: provider.categories.length,
            itemBuilder: (context, index) {
              final category = provider.categories[index];

              return CategoryCard(
                category: category,
                onEdit: () {},
                onDelete: () {},
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(
            context,
            AppRoutes.createCategory,
          );
          if(!mounted) return;
          context.read<CategoryProvider>().loadCategories();
        },

        child: Icon(Icons.add),
      ),
    );

  }
}