import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  static CollectionReference FCM_Tokens = FirebaseFirestore.instance.collection('FCM_Tokens');
  static CollectionReference users = FirebaseFirestore.instance.collection('Users');
  static CollectionReference departmentCarousel = FirebaseFirestore.instance.collection('department_carousels');
  static CollectionReference culutrals = FirebaseFirestore.instance.collection('events');
  static CollectionReference mainEvents = FirebaseFirestore.instance.collection('TechEvents_MainEvents');


}