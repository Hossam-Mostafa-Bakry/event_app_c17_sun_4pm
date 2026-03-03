import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app_c17_sun_4pm/models/event_data_model.dart';

abstract class FirebaseUtils {
  static CollectionReference<EventDataModel> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection("EventCollection")
        .withConverter<EventDataModel>(
          fromFirestore:
              (snapshot, _) => EventDataModel.fromFirestore(snapshot.data()!),
          toFirestore: (value, _) => value.toFirestore(),
        );
  }

  static Future<void> addEvent(EventDataModel data) async {
    var collectionRef = getCollectionRef();

    var docRef = collectionRef.doc();
    data.eventID = docRef.id;
    docRef.set(data);
  }
}
