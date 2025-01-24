import 'package:abhiyanth/models/user_model.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/custom_snackbar.dart';
import 'package:abhiyanth/services/db_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:abhiyanth/locator.dart';
class SignupViewModel extends BaseViewModel{

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  BuildContext? context;

  Future <void> signupGoogle()async{
    try{
      _isLoading=true;
      notifyListeners();
      final user = await userService.signInWithGoogle();
      if (user != null) {
        final FCM_Token = await DBService.FCM_Tokens.doc("Tokens");
        final String token = await notificationServices.getToken();
        FCM_Token.update({
          "Token": FieldValue.arrayUnion([token])
        });
        Navigator.pushNamedAndRemoveUntil(context!, RoutesName.login,(route) => false);
      }
    }
    catch(e)
    {
      CustomSnackBar.show(context!, 'Google Sign-In failed' , type: "error");
    }
    finally{
      _isLoading=false;
      notifyListeners();
    }
  }
  Future<void> signup(String email, String password, BuildContext context,) async {
    try {
      _isLoading = true;
      notifyListeners();

      final user = await userService.signupWithEmailAndPassword(emailController.text, passwordController.text);

      if (user != null) {

        CustomSnackBar.show(context!, "SignUp successful" , type : "success");

        Navigator.pushNamedAndRemoveUntil(
          context!,
          RoutesName.login,
              (route) => false,
        );
      } else {
        CustomSnackBar.show(context!, "Signup failed. Please try again." ,type: "error");
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
      CustomSnackBar.show(context!, errorMessage, type: "error");
    } catch (e) {
      CustomSnackBar.show(context!, 'Signup failed. Please try again.' , type: "error");
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

