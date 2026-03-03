import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:event_app_c17_sun_4pm/core/gen/assets.gen.dart';
import 'package:event_app_c17_sun_4pm/core/l10n/app_localizations.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLocalization = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox.shrink(),
        title: Assets.icons.eventlyLogo.image(width: 142),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 47),
              Text(
                "Create your account",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorPallete.primary,
                ),
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                controller: _nameController,
                hintText: appLocalization.name,
                prefixIcon: Assets.icons.userSvg.svg(),
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                controller: _emailController,
                hintText: appLocalization.email,
                prefixIcon: Assets.icons.sms.svg(),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                controller: _passwordController,
                isPassword: true,
                hintText: appLocalization.password,
                prefixIcon: Assets.icons.lock.svg(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  final passwordRegex = RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*(),.?":{}|<>]).{8,}$',
                  );
                  if (!passwordRegex.hasMatch(value)) {
                    return 'Password must be at least 8 characters long and include:\n'
                        '• At least one uppercase letter\n'
                        '• At least one lowercase letter\n'
                        '• At least one number\n'
                        '• At least one special character';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                isPassword: true,
                hintText: appLocalization.password,
                prefixIcon: Assets.icons.lock.svg(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Re-password';
                  }

                  if (value != _passwordController.text) {
                    return 'Password does not match';
                  }

                  return null;
                },
              ),
              SizedBox(height: 55),
              CustomButtonWidget(
                text: appLocalization.create_account,
                onPressed: () {
                  /// Validation
                  if (_formKey.currentState!.validate()) {}
                },
              ),
              SizedBox(height: 24),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: appLocalization.already_have_account,
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
                          appLocalization.login,
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
                    appLocalization.or,
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
                      appLocalization.login_with_google,
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
      ),
    );
  }
}
