import 'package:flutter/material.dart';

import 'icon_picker.dart';

class IconPickerBottomSheet extends StatelessWidget {
  final String? selectedIcon;
  final ValueChanged<String> onIconSelected;

  const IconPickerBottomSheet({
    super.key,
    required this.selectedIcon,
    required this.onIconSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const Text(
              "Choisir une icône",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            IconPicker(
              selectedIcon: selectedIcon,
              onIconSelected: (icon) {

                onIconSelected(icon);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}