import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signup(String email, String password, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Create user with email and password using Firebase
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if user was created successfully
      if (userCredential.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("SignUp successful")),
        );

        // Navigate to the home screen after successful signup
        Navigator.pushReplacementNamed(context, RoutesName.home);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Signup failed. Please try again.")),
        );
      }

      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase errors
      _isLoading = false;
      notifyListeners();

      String errorMessage = "Signup failed. Please try again.";
      if (e.code == 'email-already-in-use') {
        errorMessage = "The email is already in use. Please use a different email.";
      } else if (e.code == 'weak-password') {
        errorMessage = "The password is too weak. Please choose a stronger password.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "The email address is invalid.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      // Catch any other errors
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup failed. Please try again.')),
      );
    }
  }

  // Optionally, a function to clear the form if needed
  void clear() {
    _isLoading = false;
    notifyListeners();
  }
}
