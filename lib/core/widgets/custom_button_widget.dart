import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final void Function()? onPressed;
  final Widget? customChild;
  final String? text;

  const CustomButtonWidget({
    super.key,
    this.text,
    this.customChild,
    this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor: backgroundColor ?? ColorPallete.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(width: 1.5, color: ColorPallete.primary),
              ),
            ),
            child:
                customChild ??
                Text(
                  text ?? "",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
