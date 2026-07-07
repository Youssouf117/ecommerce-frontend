import 'package:ecommerce_mobile/features/admin/widgets/category_form.dart';
import 'package:ecommerce_mobile/features/category/providers/category_provider.dart';
import 'package:ecommerce_mobile/features/category/requests/create_category_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() =>
      _CreateCategoryScreenState();
}

class _CreateCategoryScreenState
    extends State<CreateCategoryScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController descriptionController =
  TextEditingController();

  String? selectedIcon;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> createCategory() async {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedIcon == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Veuillez choisir une icône.",
          ),
        ),
      );
      return;
    }

    final provider =
    context.read<CategoryProvider>();

    final success = await provider.createCategory(
      CreateCategoryRequest(
        name: nameController.text.trim(),
        description:
        descriptionController.text.trim(),
        icon: selectedIcon!,
      ),
    );

    if (!mounted) return;

    if (success) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Catégorie créée avec succès.",
          ),
        ),
      );

      Navigator.pop(context);

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            provider.errorMessage ??
                "Une erreur est survenue.",
          ),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    final categoryProvider =
    context.watch<CategoryProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nouvelle catégorie",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: CategoryForm(
          formKey: _formKey,
          nameController: nameController,
          descriptionController:
          descriptionController,
          selectedIcon: selectedIcon,
          onIconSelected: (icon) {
            setState(() {
              selectedIcon = icon;
            });
          },
          onSubmit: createCategory,
        ),
      ),
    );
  }
}