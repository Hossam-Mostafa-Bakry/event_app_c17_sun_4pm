import 'package:event_app_c17_sun_4pm/core/app_theme/color_pallete.dart';
import 'package:event_app_c17_sun_4pm/core/gen/assets.gen.dart';
import 'package:event_app_c17_sun_4pm/core/utlils/firebase_utils.dart';
import 'package:event_app_c17_sun_4pm/core/widgets/custom_button_widget.dart';
import 'package:event_app_c17_sun_4pm/core/widgets/custom_text_form_field.dart';
import 'package:event_app_c17_sun_4pm/models/event_category_model.dart';
import 'package:event_app_c17_sun_4pm/models/event_data_model.dart';
import 'package:event_app_c17_sun_4pm/modules/app_provider/app_settings_provider.dart';
import 'package:event_app_c17_sun_4pm/modules/layout/home/widgets/tab_event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

class AddEventView extends StatefulWidget {
  const AddEventView({super.key});

  @override
  State<AddEventView> createState() => _AddEventViewState();
}

class _AddEventViewState extends State<AddEventView> {
  DateTime? selectedDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
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
    final theme = Theme.of(context);
    final provider = Provider.of<AppSettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Add Event")),
      body: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 195,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorPallete.strokeMainColor),
                image: DecorationImage(
                  image: AssetImage(
                    provider.isDark()
                        ? categoriesList[_currentTabIndex].darkImage
                        : categoriesList[_currentTabIndex].image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextFormField(
                    controller: _titleController,
                    hintText: "Event Title",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "please enter title";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextFormField(
                    controller: _descController,
                    maxLines: 3,
                    hintText: "Event Description....",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "please enter description";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.calendar_month, color: theme.primaryColor),
                  Expanded(
                    child: Text(
                      "Event Date",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Bounceable(
                    onTap: () {
                      getSelectedDate();
                    },
                    child: Text(
                      selectedDate == null
                          ? "Choose date"
                          : selectedDate.toString(),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: CustomButtonWidget(
                text: "Add Event",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (selectedDate == null) return;

                    var data = EventDataModel(
                      eventTitle: _titleController.text,
                      eventDescription: _descController.text,
                      categoryID: "categoriesList[provider.currentIndex].id",
                      categoryImg:
                          "categoriesList[provider.currentIndex].image",
                      selectedDate: selectedDate!,
                    );

                    FirebaseUtils.addEvent(data);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getSelectedDate() async {
    var date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (date != null) {
      selectedDate = date;
      setState(() {});
    }
  }
}
