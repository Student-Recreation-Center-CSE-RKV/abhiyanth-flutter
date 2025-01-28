import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllNotifications() async {
    try {
      // Fetch all documents from the "notifications" collection
      QuerySnapshot snapshot =
          await _firestore.collection('notifications').get();

      // Map the data to a list of maps
      return snapshot.docs.map((doc) {
        return {
          'id': doc.id, // Document ID
          'title': doc['title']?.toString() ?? '',
          'sub_title': doc['sub_title']?.toString() ?? '',
          'description': doc['description']?.toString() ?? '',
          'image': doc['image']?.toString() ?? '',
          'time': doc['time'] ?? 'No_time',
        };
      }).toList();
    } catch (e) {
      print('Error fetching notifications: $e');
      return [];
    }
  }
}
