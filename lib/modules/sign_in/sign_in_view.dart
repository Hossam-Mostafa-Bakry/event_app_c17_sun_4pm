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
    final theme = Theme.of(context);

    final appLocalizations = AppLocalizations.of(context)!;
    AppSettingsProvider appSettingsProvider = Provider.of<AppSettingsProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Assets.icons.eventlyLogo.image(width: 142),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 48),
            Text(
              "Login to your account",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorPallete.primary,
              ),
            ),
            SizedBox(height: 24),
            CustomTextFormField(
              controller: emailController,
              hintText: appLocalizations.email,
              prefixIcon: Assets.icons.sms.svg(),
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              controller: passwordController,
              isPassword: true,
              maxLines: 1,
              hintText: appLocalizations.password,
              prefixIcon: Assets.icons.lock.svg(),
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
            SizedBox(height: 48),
            CustomButtonWidget(
              text: appLocalizations.login,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  PagesRouteName.layout,
                  (route) => false,
                );
              },
            ),
            SizedBox(height: 48),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: appLocalizations.do_not_have_account,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  WidgetSpan(
                    child: Bounceable(
                      onTap: () {
                        Navigator.pushNamed(context, PagesRouteName.signUp);
                      },
                      child: Text(
                        appLocalizations.create_account,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
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
            SizedBox(height: 32),
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
              borderColor: ColorPallete.strokeMainColor,
              backgroundColor: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
