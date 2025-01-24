import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:abhiyanth/services/db_services.dart';
import 'package:abhiyanth/models/user_model.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:flutter/material.dart';


class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print('Error during Google sign-in: $e');
      return null;
    }
  }

  Future<User?> signupWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e; // Let the caller handle specific FirebaseAuth exceptions
    } catch (e) {
      throw Exception("Signup failed. Please try again.");
    }
  }
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e; // Let the caller handle specific FirebaseAuth exceptions
    } catch (e) {
      throw Exception("Signup failed. Please try again.");
    }
  }

  // Function to handle user sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

   Future<void> createNewUser(UserModel user) async {
    await DBService.users.doc(user.uid).set(user.toJson());
    return;
  }
}
