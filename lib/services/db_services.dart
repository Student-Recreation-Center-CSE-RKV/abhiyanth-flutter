import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  static CollectionReference FCM_Tokens = FirebaseFirestore.instance.collection('FCM_Tokens');
}