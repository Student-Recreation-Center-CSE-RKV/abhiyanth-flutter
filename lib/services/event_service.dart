import 'package:abhiyanth/models/department_event_model.dart';
import 'package:abhiyanth/services/db_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {

  Future<DepartmentEventModel> getEvents() async {
    try {
      List<Map<String, dynamic>> eventDataList = [];
      QuerySnapshot querySnapshot = await DBService.mainEvents.get();
      for (var doc in querySnapshot.docs) {
        final eventData = doc.data() as Map<String,dynamic>;
        final eventDate = (eventData['date'] as Timestamp?)?.toDate();

        if (eventDate != null) {
          eventDataList.add({
            'id': doc.id,
            'description': eventData['description']?.toString() ?? 'No Description',
            'image': eventData['image']?.toString() ?? 'https://via.placeholder.com/150',
            'prizes': eventData['prizes'] ?? [],
            'registration_link': eventData['registration_link']?.toString() ?? '',
            'result': eventData['result'] ?? [],
            'sponsors': eventData['sponsors'] ?? [],
            'date': eventDate.toIso8601String(),
            'venue': eventData['venue']?.toString()??"",
            'title': eventData['title'] ?? 'CSE tech',
            'short_description':eventData['short_description']??'',
            'amount': eventData['amount']??0,
          });
        } else {
          print('Event with ID ${doc.id} has a null date.');
        }
      }
      return DepartmentEventModel.fromList(eventDataList,[]);
    } catch (e) {
      print('Error fetching central events: $e');
      return DepartmentEventModel(ongoingEvents: [], departmentCarousel: []);
    }
  }
}
