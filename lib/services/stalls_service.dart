import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/stalls_model.dart';

class StallsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all stalls from Firestore
  Future<List<StallModel>> getStalls() async {
    try {
      final querySnapshot = await _firestore.collection("Stalls").get();
      return querySnapshot.docs.map((doc) => StallModel.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception("Failed to fetch stalls: $e");
    }
  }
}
