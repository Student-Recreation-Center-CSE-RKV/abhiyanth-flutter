import 'package:cloud_firestore/cloud_firestore.dart';

class CulturalsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, String>>> getOngoingCulturals() async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('Culturals').doc('Ongoing').get();

      // Access and cast the data to List<Map<String, String>>
      List<dynamic> data = snapshot['Ongoing'] ?? [];
      return data.map((item) {
        return {
          'image': item['image']?.toString() ?? '',
          'text': item['title']?.toString() ?? '',
        };
      }).toList();
    } catch (e) {
      print('Error fetching ongoing culturals: $e');
      return [];
    }
  }

  // Fetch Upcoming Cultural Events
  Future<List<Map<String, String>>> getUpcomingCulturals() async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('Culturals').doc('Upcoming').get();

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
      print('Error fetching upcoming culturals: $e');
      return [];
    }
  }
}
