import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:event_app_c17_sun_4pm/models/event_category_model.dart';
import 'package:flutter/material.dart';

class TabEventItem extends StatelessWidget {
  final bool isSelected;
  final EventCategoryModel data;

  const TabEventItem({super.key, required this.data, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? theme.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorPallete.strokeMainColor),
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            data.icon,
            color: isSelected ? Colors.white : theme.primaryColor,
          ),
          Text(
            data.name,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: isSelected ? Colors.white : ColorPallete.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
