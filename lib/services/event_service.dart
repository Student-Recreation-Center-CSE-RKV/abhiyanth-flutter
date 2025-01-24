import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to get central_events data from Firestore
  Future<List<Map<String, dynamic>>> getEvents() async {
    try {
      // Fetch all documents from the 'central_events' collection
      QuerySnapshot snapshot = await _firestore.collection('central_events').get();

      // Convert each document to a map and process the date fields
      List<Map<String, dynamic>> events = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;

        // Convert 'start_date' and 'end_date' to formatted strings
        if (data['start_date'] != null && data['start_date'] is Timestamp) {
          Timestamp startDate = data['start_date'];
          data['start_date_formatted'] = DateFormat('dd-MM-yyyy hh:mm a').format(startDate.toDate());
        }

        if (data['end_date'] != null && data['end_date'] is Timestamp) {
          Timestamp endDate = data['end_date'];
          data['end_date_formatted'] = DateFormat('dd-MM-yyyy hh:mm a').format(endDate.toDate());
        }

        // Convert 'deadline' to a formatted string
        if (data['deadline'] != null && data['deadline'] is Timestamp) {
          Timestamp deadline = data['deadline'];
          data['deadline_formatted'] = DateFormat('dd-MM-yyyy hh:mm a').format(deadline.toDate());
        }

        // Include a sorting field for 'start_date'
        if (data['start_date'] != null && data['start_date'] is Timestamp) {
          data['startDateTime'] = (data['start_date'] as Timestamp).toDate();
        }

        return data;
      }).toList();

      // Sort events by 'startDateTime' in ascending order (earliest first)
      events.sort((a, b) => (a['startDateTime'] as DateTime).compareTo(b['startDateTime'] as DateTime));

      return events;
    } catch (e) {
      print('Error fetching central events: $e');
      return [];
    }
  }
}
