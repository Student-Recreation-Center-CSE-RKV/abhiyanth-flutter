import 'package:abhiyanth/locator.dart';
import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/custom_snackbar.dart';
import 'package:abhiyanth/services/db_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/Routes/routesname.dart';
import 'package:abhiyanth/locator.dart';

class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  NavigationService navigationservice = NavigationService();

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
    if (_email == null ||
        _password == null ||
        _email!.isEmpty ||
        _password!.isEmpty) {
      CustomSnackBar.show(context, "Please enter both email and password",
          type: "warning");
      return;
    }

    try {
      // Start loading state
      _isLoading = true;

      CustomSnackBar.show(context, "Logging in...");

      notifyListeners();

      // Attempt to sign in with Firebase Authentication
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      final FCM_Token = await DBService.FCM_Tokens.doc("Tokens");
      final String token = await notificationServices.getToken();
      FCM_Token.update({
        "Token": FieldValue.arrayUnion([token])
      });

      // Show success message
      CustomSnackBar.show(context, "Login successful", type: "success");

      // Navigate to the home screen
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.home,
        (route) => false,
      );
      navigationservice.removeAllAndPush(RoutesName.home,RoutesName.login);
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
          errorMessage =
              "Network error. Please check your internet connection.";
          break;
        default:
          errorMessage = "Error: ${e.message}";
      }

      // Show error message
      CustomSnackBar.show(context, errorMessage, type: "error");

      // Stop loading state
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      // General error catch
      print("General error: $e");
      CustomSnackBar.show(
          context, "An unexpected error occurred. Please try again.",
          type: "error");

      _isLoading = false;
      notifyListeners();
    }
  }

}
