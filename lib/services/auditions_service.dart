import 'package:cloud_firestore/cloud_firestore.dart';

class AuditionsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, String>>> getOngoingAuditions() async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('Auditions').doc('ongoing').get();

      // Access and cast the data to List<Map<String, String>>
      List<dynamic> data = snapshot['ongoing'] ?? [];
      return data.map((item) {
        return {
          'image': item['image']?.toString() ?? '',
          'text': item['title']?.toString() ?? '',
        };
      }).toList();
    } catch (e) {
      print('Error fetching ongoing Auditions: $e');
      return [];
    }
  }

  // Fetch Upcoming Cultural Events
  Future<List<Map<String, String>>> getUpcomingAuditions() async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('Auditions').doc('Upcoming').get();

      List<dynamic> data = snapshot['upcoming'] ?? [];
      return data.map((item) {
        return {
          'title': item['title']?.toString() ?? '',
          'venue': item['venue']?.toString() ?? '',
          'description': item['description']?.toString() ?? '',
          // Convert Timestamp to formatted string
          'date_time': (item['date_time'] as Timestamp)
              .toDate()
              .toString(), // Adjust format if needed
        };
      }).toList();
    } catch (e) {
      print('Error fetching upcoming Auditions: $e');
      return [];
    }
  }
}
