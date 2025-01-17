import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/custom_snackbar.dart';
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

      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        CustomSnackBar.show(context, "SignUp successful");

        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.home,
              (route) => false,
        );
      } else {
        CustomSnackBar.show(context, "Signup failed. Please try again.");
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

      CustomSnackBar.show(context, errorMessage);
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      CustomSnackBar.show(context, 'Signup failed. Please try again.');
    }
  }

  void clear() {
    _isLoading = false;
    notifyListeners();
  }
}
