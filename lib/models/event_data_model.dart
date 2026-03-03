class EventDataModel {
  String? eventID;
  final String eventTitle;
  final String eventDescription;
  final String categoryID;
  final String categoryImg;
  final DateTime selectedDate;
  final bool isFavorite;

  EventDataModel({
    this.eventID,
    this.isFavorite = false,
    required this.eventTitle,
    required this.eventDescription,
    required this.categoryID,
    required this.categoryImg,
    required this.selectedDate,
  });

  factory EventDataModel.fromFirestore(Map<String, dynamic> json) {
    return EventDataModel(
      eventID: json["eventID"],
      eventTitle: json["eventTitle"],
      eventDescription: json["eventDescription"],
      categoryID: json["categoryID"],
      categoryImg: json["categoryImg"],
      selectedDate: DateTime.fromMillisecondsSinceEpoch(json["selectedDate"]),
      isFavorite: json["isFavorite"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "eventID": eventID,
      "eventTitle": eventTitle,
      "eventDescription": eventDescription,
      "categoryID": categoryID,
      "categoryImg": categoryImg,
      "selectedDate": selectedDate.millisecondsSinceEpoch,
      "isFavorite": isFavorite,
    };
  }
}
