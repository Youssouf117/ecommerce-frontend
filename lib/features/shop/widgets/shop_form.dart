import 'package:ecommerce_mobile/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_button.dart';

class ShopForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController descriptionController;

  final String? logo;
  final VoidCallback onChooseLogo;
  final VoidCallback onSubmit;

  const ShopForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.descriptionController,
    required this.logo,
    required this.onChooseLogo,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [

          CustomTextField(
            hintText: "Nom de la boutique",
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Veuillez entrer le nom";
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          CustomTextField(
            hintText: "Description",
            controller: descriptionController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Veuillez entrer une description";
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          OutlinedButton.icon(
            onPressed: onChooseLogo,
            icon: const Icon(Icons.image),
            label: Text(
              logo == null
                  ? "Choisir un logo"
                  : "Logo sélectionné",
            ),
          ),

          const SizedBox(height: 30),

          CustomButton(
            text: "Créer la boutique",
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}