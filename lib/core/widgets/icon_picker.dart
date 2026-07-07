import 'package:flutter/material.dart';

import '../constants/app_icons.dart';

class IconPicker extends StatelessWidget {
  final String? selectedIcon;
  final ValueChanged<String> onIconSelected;

  const IconPicker({
    super.key,
    required this.selectedIcon,
    required this.onIconSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: AppIcons.icons.length,

      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),

      itemBuilder: (context, index) {

        final iconName =
        AppIcons.icons.keys.elementAt(index);

        final iconData =
        AppIcons.icons.values.elementAt(index);

        final isSelected =
            selectedIcon == iconName;

        return GestureDetector(
          onTap: () {
            onIconSelected(iconName);
          },

          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context)
                  .primaryColor
                  .withOpacity(0.15)
                  : Colors.grey.shade200,

              borderRadius:
              BorderRadius.circular(12),

              border: Border.all(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                width: 2,
              ),
            ),

            child: Icon(
              iconData,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}