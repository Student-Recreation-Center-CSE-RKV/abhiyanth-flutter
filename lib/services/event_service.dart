import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class EventService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to get events data from Firestore, sort by date
  Future<List<Map<String, dynamic>>> getEvents() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('mobile_all_events').get();

      // Convert snapshot to a list of maps and sort by date
      List<Map<String, dynamic>> events = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;

        // Check if the 'date' field is a Timestamp and convert it to a formatted string
        if (data['date'] is Timestamp) {
          Timestamp timestamp = data['date'];
          DateTime dateTime = timestamp.toDate();

          // Format the date as a string
          String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
          data['date'] = formattedDate;

          // Include a 'dateTime' field for sorting
          data['dateTime'] = dateTime;
        }
        return data;
      }).toList();

      // Sort the events by the 'dateTime' field in descending order (latest first)
      events.sort((b,a) => (b['dateTime'] as DateTime).compareTo(a['dateTime'] as DateTime));

      return events;
    } catch (e) {
      print('Error fetching events: $e');
      return [];
    }
  }
}
