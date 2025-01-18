import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/user_service.dart';
import 'package:stacked/stacked.dart';
class SignupViewModel extends BaseViewModel{

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final UserService _userService=UserService();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  BuildContext? context;

  Future <void> signupGoogle()async{
    try{
      _isLoading=true;
      notifyListeners();
      final user = await _userService.signInWithGoogle();
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context!, RoutesName.home,(route) => false);
      }
    }
    catch(e)
    {
      CustomSnackBar.show(context!, 'Google Sign-In failed');
    }
    finally{
      _isLoading=false;
      notifyListeners();
    }
  }
  Future<void> signup() async {
    try {
      _isLoading = true;
      notifyListeners();

      final user = await _userService.signupWithEmailAndPassword(emailController.text, passwordController.text);

      if (user != null) {
        CustomSnackBar.show(context!, "SignUp successful");

        Navigator.pushNamedAndRemoveUntil(
          context!,
          RoutesName.home,
              (route) => false,
        );
      } else {
        CustomSnackBar.show(context!, "Signup failed. Please try again.");
      }


    } on FirebaseAuthException catch (e) {
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
      CustomSnackBar.show(context!, errorMessage);
    } catch (e) {
      CustomSnackBar.show(context!, 'Signup failed. Please try again.');
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _isLoading = false;
    notifyListeners();
  }
}

