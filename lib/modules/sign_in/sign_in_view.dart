import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:event_app_c17_sun_4pm/core/gen/assets.gen.dart';
import 'package:event_app_c17_sun_4pm/core/l10n/app_localizations.dart';
import 'package:event_app_c17_sun_4pm/core/routes/pages_route_name.dart';
import 'package:event_app_c17_sun_4pm/core/widgets/custom_button_widget.dart';
import 'package:event_app_c17_sun_4pm/core/widgets/custom_text_form_field.dart';
import 'package:event_app_c17_sun_4pm/modules/app_provider/app_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
    final appLocalizations = AppLocalizations.of(context)!;
    AppSettingsProvider appSettingsProvider = Provider.of<AppSettingsProvider>(
      context,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Assets.images.logoIcn.image(width: 185, height: 185),
            SizedBox(height: 24),
            CustomTextFormField(
              controller: emailController,
              hintText: appLocalizations.email,
              prefixIcon: Assets.icons.mailIcn.svg(),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: passwordController,
              isPassword: true,
              hintText: appLocalizations.password,
              prefixIcon: Assets.icons.passwordIcn.svg(),
            ),
            SizedBox(height: 16),
            Bounceable(
              onTap: () {
                Navigator.pushNamed(context, PagesRouteName.forgetPassword);
              },
              child: Text(
                appLocalizations.forgetPassword,
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
            CustomButtonWidget(text: appLocalizations.login, onPressed: () {}),
            SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: appLocalizations.do_not_have_account,
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
                        appLocalizations.create_account,
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
                  appLocalizations.or,
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
                    appLocalizations.login_with_google,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorPallete.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Bounceable(
                  onTap: () {
                    if (appSettingsProvider.currentLanguage == "ar") {
                      appSettingsProvider.changeLanguage('en');
                    } else {
                      appSettingsProvider.changeLanguage('ar');
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorPallete.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      appSettingsProvider.currentLanguage == "en" ? "En" : "Ar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {
                    if (appSettingsProvider.currentTheme == ThemeMode.light) {
                      appSettingsProvider.changeTheme(ThemeMode.dark);
                    } else {
                      appSettingsProvider.changeTheme(ThemeMode.light);
                    }
                  },
                  child: CircleAvatar(
                    backgroundColor: ColorPallete.primary,
                    child: Icon(Icons.sunny, size: 30, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
