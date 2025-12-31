import 'package:event_app_c17_sun_4pm/core/gen/assets.gen.dart';
import 'package:event_app_c17_sun_4pm/core/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

import '../../core/app_theme/color_pallete.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorPallete.primary),
        title: Text(
          "Forget Password",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: ColorPallete.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Assets.images.forgetPasswordImg.image(),
            CustomButtonWidget(onPressed: () {}, text: "Reset Password"),
          ],
        ),
      ),
    );
  }
}
