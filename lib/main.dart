import 'package:flutter/material.dart';

import 'core/app_theme/theme_manager.dart';
import 'core/routes/app_generate_route.dart';
import 'core/routes/pages_route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // easy localization

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evently App',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.getLightTheme(),
      darkTheme: ThemeManager.getDarkTheme(),
      initialRoute: PagesRouteName.splash,
      onGenerateRoute: AppGenerateRoute.onGenerateRoute,
    );
  }
}
