import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:event_app_c17_sun_4pm/core/gen/assets.gen.dart';
import 'package:event_app_c17_sun_4pm/core/routes/pages_route_name.dart';
import 'package:event_app_c17_sun_4pm/core/widgets/custom_button_widget.dart';
import 'package:event_app_c17_sun_4pm/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Bounceable(
              onTap: () {
                Navigator.pushNamed(context, PagesRouteName.forgetPassword);
              },
              child: Text(
                "Forget Password?",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: ColorPallete.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: ColorPallete.primary,
                ),
              ),
            ),
            SizedBox(height: 24),
            CustomButtonWidget(text: "Login", onPressed: () {}),
            SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don’t Have Account? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(
                    child: Bounceable(
                      onTap: () {
                        Navigator.pushNamed(context, PagesRouteName.signUp);
                      },
                      child: Text(
                        "Create Account",
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
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 20,
                    endIndent: 20,

                    color: ColorPallete.primary,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorPallete.primary,
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 20,
                    endIndent: 20,
                    color: ColorPallete.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomButtonWidget(
              onPressed: () {},
              backgroundColor: Colors.transparent,
              customChild: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.googleIcn.svg(),
                  SizedBox(width: 16),
                  Text(
                    "Login with Google",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorPallete.primary,
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
