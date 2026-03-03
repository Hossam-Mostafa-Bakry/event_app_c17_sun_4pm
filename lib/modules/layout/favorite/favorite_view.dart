import 'package:event_app_c17_sun_4pm/core/widgets/custom_text_form_field.dart';
import 'package:event_app_c17_sun_4pm/modules/layout/home/widgets/event_card_item.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomTextFormField(
              hintText: "Search for event",
              suffixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 16),
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
    );
  }
}
