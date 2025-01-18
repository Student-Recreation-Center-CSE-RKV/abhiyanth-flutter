import 'package:abhiyanth/services/custom_snackbar.dart';
import 'package:abhiyanth/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../services/Routes/routesname.dart';

class LoginViewModel extends BaseViewModel {
  final UserService userService=UserService();
  BuildContext?context;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;


  // Login function using Firebase Auth
  Future<void> login(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      CustomSnackBar.show(context, "Please enter both email and password");
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      // Attempt to sign in with Firebase Authentication
      await userService.signInWithEmailAndPassword(emailController.text,passwordController.text);

      // Show success message
    CustomSnackBar.show(context, "Login successful");

      // Navigate to the home screen
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.home,(route) => false, );

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
     CustomSnackBar.show(context,errorMessage);

      // Stop loading state
      _isLoading = false;
      notifyListeners();

    } catch (e) {
      // General error catch
      print("General error: $e");
      CustomSnackBar.show(context,"An unexpected error occurred. Please try again.");

      _isLoading = false;
      notifyListeners();
    }
  }

}
