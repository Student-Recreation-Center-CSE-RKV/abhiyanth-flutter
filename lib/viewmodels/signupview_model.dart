import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/custom_snackbar.dart';
import 'package:abhiyanth/services/db_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:abhiyanth/locator.dart';
class SignupViewModel extends BaseViewModel{

  bool _isGoogleLoading=false;

  bool get isGoogleLoading=>_isGoogleLoading;
  BuildContext? context;

  Future <void> signupGoogle(BuildContext context)async{
    try{
      _isGoogleLoading=true;
      notifyListeners();
      final user = await userService.signInWithGoogle();
      if (user != null) {
        CustomSnackBar.show(context, "SignUp successful" , type : "success");
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.home,(route) => false);
      }
    }
    catch(e)
    {
      CustomSnackBar.show(context, 'Google Sign-In failed' , type: "error");
    }
    finally{
      _isGoogleLoading=false;
      notifyListeners();
    }
  }
}

