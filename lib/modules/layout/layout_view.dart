import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:event_app_c17_sun_4pm/core/gen/assets.gen.dart';
import 'package:event_app_c17_sun_4pm/core/routes/pages_route_name.dart';
import 'package:event_app_c17_sun_4pm/modules/app_provider/app_settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appSettingsProvider = Provider.of<AppSettingsProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(64),
        ),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, PagesRouteName.addEvent);
        },
      ),
      body: appSettingsProvider.pages[appSettingsProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: appSettingsProvider.currentIndex,
        onTap: appSettingsProvider.changeIndex,
        selectedItemColor: ColorPallete.primary,
        unselectedItemColor: ColorPallete.secondTextColor,
        items: [
          BottomNavigationBarItem(
            activeIcon: Assets.icons.activeHomeIcn.svg(),
            icon: Assets.icons.homeIcn.svg(),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Assets.icons.activeHeartIcn.svg(),
            icon: Assets.icons.favoriteIcn.svg(),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            activeIcon: Assets.icons.activeUserIcn.svg(),
            icon: Assets.icons.userSvg.svg(),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
