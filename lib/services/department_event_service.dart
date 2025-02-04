import 'package:abhiyanth/models/department_event_model.dart';
import 'package:abhiyanth/services/db_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentEventService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DepartmentEventModel> getTechEvents(String department) async {
    try {
      final querySnapshot = await _firestore.collection('TechEvents_$department').get();
      final dept = department=="ME"?"MECHANICAL":department=="CE"?"CHEMICAL":department.toUpperCase();
      final carouselDoc = await DBService.departmentCarousel.doc(dept).get();

      List<Map<String, dynamic>> eventDataList = [];
      List<String> departmentCarousel = [];

      if (carouselDoc.exists) {
        final data = carouselDoc.data() as Map<String, dynamic>?;
        departmentCarousel = List<String>.from(data?['images'] ?? []);
      }

      for (var doc in querySnapshot.docs) {
        final eventData = doc.data();
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
      return DepartmentEventModel.fromList(eventDataList, departmentCarousel);
    } catch (e) {
      print('Error fetching TechEvents_$department: $e');
      return DepartmentEventModel(ongoingEvents: [], departmentCarousel: []);
    }
  }
}
