import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:event_app_c17_sun_4pm/core/gen/assets.gen.dart';
import 'package:event_app_c17_sun_4pm/core/widgets/custom_button_widget.dart';
import 'package:event_app_c17_sun_4pm/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: ColorPallete.primary),
        title: Text(
          "Register",
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Assets.images.logoIcn.image(width: 185, height: 185),
            SizedBox(height: 24),
            CustomTextFormField(
              controller: emailController,
              hintText: 'Name',
              prefixIcon: Assets.icons.userIcn.svg(),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: emailController,
              hintText: 'Email',
              prefixIcon: Assets.icons.mailIcn.svg(),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: passwordController,
              isPassword: true,
              hintText: 'Password',
              prefixIcon: Assets.icons.passwordIcn.svg(),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: passwordController,
              isPassword: true,
              hintText: 'Re-Password',
              prefixIcon: Assets.icons.passwordIcn.svg(),
            ),
            SizedBox(height: 24),
            CustomButtonWidget(text: "Create Account", onPressed: () {}),
            SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already Have Account ? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(
                    child: Bounceable(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorPallete.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPallete.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
