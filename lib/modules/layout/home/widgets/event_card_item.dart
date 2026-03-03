import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:event_app_c17_sun_4pm/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class EventCardItem extends StatelessWidget {
  const EventCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 195,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorPallete.strokeMainColor),
        image: DecorationImage(
          image: Assets.images.birthdayImg.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF4F7FF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorPallete.strokeMainColor),
            ),
            child: Text(
              "21 Jan",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF4F7FF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorPallete.strokeMainColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "21 Jan",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: ColorPallete.mainTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Assets.icons.favoriteIcn.svg(
                  colorFilter: ColorFilter.mode(
                    theme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
