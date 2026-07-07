import 'package:flutter/material.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/icon_picker_bottom_sheet.dart';

class CategoryForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController descriptionController;

  final String? selectedIcon;
  final ValueChanged<String> onIconSelected;

  final VoidCallback onSubmit;

  const CategoryForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.descriptionController,
    required this.selectedIcon,
    required this.onIconSelected,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Nom
            CustomTextField(
              hintText: "Nom de la catégorie",
              controller: nameController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Veuillez entrer un nom";
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            // Description
            CustomTextField(
              hintText: "Description",
              controller: descriptionController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Veuillez entrer une description";
                }
                return null;
              },
            ),

            const SizedBox(height: 25),

            const Text(
              "Icône",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // Sélecteur d'icône
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) {
                    return IconPickerBottomSheet(
                      selectedIcon: selectedIcon,
                      onIconSelected: onIconSelected,
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [

                    Icon(
                      selectedIcon == null
                          ? Icons.category
                          : AppIcons.icons[selectedIcon]!,
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        selectedIcon == null
                            ? "Choisir une icône"
                            : selectedIcon!,
                      ),
                    ),

                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// Bouton
            CustomButton(
              text: "Enregistrer",
              onPressed: onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}