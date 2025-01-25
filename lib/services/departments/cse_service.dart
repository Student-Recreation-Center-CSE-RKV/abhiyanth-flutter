import 'package:cloud_firestore/cloud_firestore.dart';

class CseTechService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, List<Map<String, dynamic>>>> getTechEvents() async {
    try {
      final querySnapshot = await _firestore.collection('TechEvents_CSE').get();
      final now = DateTime.now();

      List<Map<String, dynamic>> ongoing = [];
      List<Map<String, dynamic>> upcoming = [];

      for (var doc in querySnapshot.docs) {
        final eventData = doc.data();
        final eventDate = (eventData['date'] as Timestamp?)?.toDate();

        if (eventDate != null) {
          final event = {
            'id': doc.id,
            'description': eventData['description']?.toString() ?? 'No Description',
            'image': eventData['image']?.toString() ?? 'https://via.placeholder.com/150',
            'prizes': eventData['prizes'] ?? [],
            'registration_link': eventData['registration_link']?.toString() ?? '',
            'result': eventData['result'] ?? [],
            'sponsors': eventData['sponsors'] ?? [],
            'date': eventDate.toString(),
            'title' :eventData['title'] ?? 'CSE tech',
          };

          if (eventDate.isBefore(now)) {
            ongoing.add(event);
          } else {
            upcoming.add(event);
          }
        } else {
          print('Event with ID ${doc.id} has a null date.');
        }
      }

      return {'ongoing': ongoing, 'upcoming': upcoming};
    } catch (e) {
      print('Error fetching TechEvents_CSE: $e');
      return {'ongoing': [], 'upcoming': []};
    }
  }
}
