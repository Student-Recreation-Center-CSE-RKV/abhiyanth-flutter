import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, String>>> getEvents() async {
    try {
      // Fetch the documents from the 'mobile_all_events' collection
      final eventsSnapshot =
          await _firestore.collection('mobile_all_events').get();

      // Parse event data
      final events = eventsSnapshot.docs.map((doc) {
        final data = doc.data();

        return {
          'id': doc.id, // Firestore document ID
          'title': data['title']?.toString() ?? '',
          'venue': data['venue']?.toString() ?? '',
          'date': (data['date'] as Timestamp)
              .toDate()
              .toString(), // Convert Firestore Timestamp to DateTime
          'image': data['image']?.toString() ?? '',
        };
      }).toList();

      print("Service - Events:");
      print(events);

      return events;
    } catch (e) {
      print('Error fetching events: $e');
      return [];
    }
  }
}
