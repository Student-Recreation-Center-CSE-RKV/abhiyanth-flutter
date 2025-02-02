import 'package:abhiyanth/models/culturals_model.dart';
import 'package:abhiyanth/services/db_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CulturalsService {

  Future<List<CulturalsModel>> getCulturals() async {
    try {
      QuerySnapshot snapshot =await DBService.culutrals.get();
      final List<CulturalsModel> CulturalList=[];
      for (var doc in snapshot.docs){
        final eventData = doc.data() as Map<String, dynamic>;
        CulturalList.add(CulturalsModel.fromJson(eventData));
      }
     return CulturalList;
    } catch (e) {
      print('Error fetching  culturals: $e');
      return [];
    }
  }

  // Fetch Upcoming Cultural Events
  // Future<List<Map<String, String>>> getUpcomingCulturals() async {
  //   try {
  //     DocumentSnapshot snapshot =
  //         await _firestore.collection('Culturals').doc('Upcoming').get();
  //
  //     List<dynamic> data = snapshot['upcoming'] ?? [];
  //     return data.map((item) {
  //       return {
  //         'title': item['title']?.toString() ?? '',
  //         'venue': item['venue']?.toString() ?? '',
  //         'description': item['description']?.toString() ?? '',
  //         // Convert Timestamp to formatted string
  //         'date_time': (item['date_time'] as Timestamp)
  //             .toDate()
  //             .toString(), // Adjust format if needed
  //       };
  //     }).toList();
  //   } catch (e) {
  //     print('Error fetching upcoming culturals: $e');
  //     return [];
  //   }
  // }
}
