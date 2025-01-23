import 'package:cloud_firestore/cloud_firestore.dart';

class AuditionsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, List<Map<String, String>>>> getAuditions() async {
    try {
      final ongoingSnapshot =
          await _firestore.collection('Auditions').doc('ongoing').get();

      // Parse ongoing auditions
      List<dynamic> ongoingData = ongoingSnapshot['ongoing'] ?? [];
      final ongoing = ongoingData.map((item) {
        return {
          'image': item['image']?.toString() ?? '',
          'text': item['title']?.toString() ?? '',
        };
      }).toList();

      // Parse upcoming auditions
      List<dynamic> upcomingData = ongoingSnapshot['upcoming'] ?? [];
      final upcoming = upcomingData.map((item) {
        return {
          'title': item['title']?.toString() ?? '',
          'venue': item['venue']?.toString() ?? '',
          'description': item['description']?.toString() ?? '',
          'date_time': (item['date_time'] as Timestamp)
              .toDate()
              .toString(), // Convert timestamp
        };
      }).toList();
      print("service:");
    print(ongoing);
    print(upcoming);
      return {'ongoing': ongoing, 'upcoming': upcoming};
    } catch (e) {
      print('Error fetching auditions: $e');
      return {'ongoing': [], 'upcoming': []};
    }
  }
}
