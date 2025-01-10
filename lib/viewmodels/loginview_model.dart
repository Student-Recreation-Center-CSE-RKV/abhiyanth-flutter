import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/Routes/routesname.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _email;
  String? _password;
  bool _isLoading = false;

  String get email => _email ?? '';
  String get password => _password ?? '';
  bool get isLoading => _isLoading;

  // Set email and password
  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  // Login function using Firebase Auth
  Future<void> login(BuildContext context) async {
    if (_email == null || _password == null || _email!.isEmpty || _password!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    try {
      // Start loading state
      _isLoading = true;
      notifyListeners();

      // Attempt to sign in with Firebase Authentication
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful")),
      );

      // Navigate to the home screen
      Navigator.pushReplacementNamed(context, RoutesName.home);

      // Stop loading state
      _isLoading = false;
      notifyListeners();

    } on FirebaseAuthException catch (e) {
      // Detailed error handling for FirebaseAuthException
      String errorMessage = "An error occurred. Please try again.";
      print("FirebaseAuthException: ${e.code}, ${e.message}");

      // Handle specific Firebase error codes
      switch (e.code) {
        case 'user-not-found':
          errorMessage = "No user found with this email.";
          break;
        case 'wrong-password':
          errorMessage = "Incorrect password.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is invalid.";
          break;
        case 'network-request-failed':
          errorMessage = "Network error. Please check your internet connection.";
          break;
        default:
          errorMessage = "Error: ${e.message}";
      }

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );

      // Stop loading state
      _isLoading = false;
      notifyListeners();

    } catch (e) {
      // General error catch
      print("General error: $e");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An unexpected error occurred. Please try again.")),
      );

      // Stop loading state
      _isLoading = false;
      notifyListeners();
    }
  }

}
