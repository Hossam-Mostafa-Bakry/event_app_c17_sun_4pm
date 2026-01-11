import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_theme/theme_manager.dart';
import '/core/l10n/app_localizations.dart';
import 'core/routes/pages_route_name.dart';
import 'core/routes/app_generate_route.dart';
import 'modules/app_provider/app_settings_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // easy localization

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    AppSettingsProvider appSettingsProvider = Provider.of<AppSettingsProvider>(
      context,
    );

    return MaterialApp(
      title: 'Evently App',
      themeMode: appSettingsProvider.currentTheme,
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getLightTheme(),
      darkTheme: ThemeManager.getDarkTheme(),
      initialRoute: PagesRouteName.splash,
      onGenerateRoute: AppGenerateRoute.onGenerateRoute,
      locale: Locale(appSettingsProvider.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
