import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:event_app_c17_sun_4pm/core/gen/assets.gen.dart';
import 'package:event_app_c17_sun_4pm/models/event_category_model.dart';
import 'package:event_app_c17_sun_4pm/modules/app_provider/app_settings_provider.dart';
import 'package:event_app_c17_sun_4pm/modules/layout/home/widgets/event_card_item.dart';
import 'package:event_app_c17_sun_4pm/modules/layout/home/widgets/tab_event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<EventCategoryModel> categoriesList = [
    EventCategoryModel(
      id: "sport",
      name: "Sport",
      image: Assets.images.sportImg.path,
      darkImage: Assets.images.sportDarkImg.path,
      icon: Icons.directions_bike,
    ),
    EventCategoryModel(
      id: "birthday",
      name: "Birthday",
      image: Assets.images.birthdayImg.path,
      darkImage: Assets.images.birthdayDarkImg.path,
      icon: Icons.cake_outlined,
    ),
    EventCategoryModel(
      id: "meeting",
      name: "Meeting",
      image: Assets.images.meetingImg.path,
      darkImage: Assets.images.meetingDarkImg.path,
      icon: Icons.meeting_room_outlined,
    ),
    EventCategoryModel(
      id: "book_club",
      name: "BookClub",
      image: Assets.images.bookClubImg.path,
      darkImage: Assets.images.bookClubDarkImg.path,
      icon: Icons.chrome_reader_mode_rounded,
    ),
  ];

  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppSettingsProvider>(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            spacing: 8,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back ✨",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: ColorPallete.secondTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Hossam Bakry",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: ColorPallete.mainTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Bounceable(
                onTap: () {
                  provider.isDark()
                      ? provider.changeTheme(ThemeMode.light)
                      : provider.changeTheme(ThemeMode.dark);
                },
                child: Icon(
                  provider.isDark()
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_outlined,
                  size: 30,
                  color: theme.primaryColor,
                ),
              ),
              Bounceable(
                onTap: () {
                  provider.currentLanguage == "en"
                      ? provider.changeLanguage("ar")
                      : provider.changeLanguage("en");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5.5),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    provider.currentLanguage == "en" ? "En" : "Ar",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          spacing: 24,
          children: [
            SizedBox.shrink(),
            DefaultTabController(
              length: categoriesList.length,
              child: TabBar(
                isScrollable: true,
                onTap: (index) {
                  setState(() {
                    _currentTabIndex = index;
                  });
                },
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.symmetric(horizontal: 8),
                indicator: BoxDecoration(),
                tabs:
                    categoriesList.map((EventCategoryModel data) {
                      return TabEventItem(
                        isSelected:
                            _currentTabIndex == categoriesList.indexOf(data),
                        data: data,
                      );
                    }).toList(),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return EventCardItem();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
