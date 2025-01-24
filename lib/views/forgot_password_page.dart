import 'package:abhiyanth/services/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import '../services/size_config.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final auth = FirebaseAuth.instance;

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top section with image and welcome text
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 15,
                    bottom: SizeConfig.blockSizeVertical * 1,
                    left: SizeConfig.blockSizeHorizontal * 5,
                    right: SizeConfig.blockSizeHorizontal * 5),
                child: Column(
                  children: [
                    // Image at the top
                    Image.asset(
                      'assets/images/Abhiyanthlogo2.png',
                      fit: BoxFit.cover,
                      width: SizeConfig.safeBlockHorizontal * 30,
                      height: SizeConfig.blockSizeVertical * 18,
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 2),
                    // Event Title Text
                    Text(
                      "Abhiyanth 2k25",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "AudioWide",
                        fontSize: SizeConfig.blockSizeVertical * 3,
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2),
                    // Welcome Back Text
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'AudioWide',
                        fontSize: SizeConfig.safeBlockHorizontal * 8,
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 5,
                    vertical: SizeConfig.blockSizeVertical * 5),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockHorizontal * 10,
                    ),
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      // TextFormField for email
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            SizeConfig.safeBlockHorizontal * 10,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 3,
                        ),
                        child: TextFormField(
                          controller: _emailcontroller,
                          decoration: const InputDecoration(
                            hintText: "Enter your email",
                            hintStyle: TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
              // Reset button
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 1,
                  left: SizeConfig.blockSizeVertical * 5,
                  right: SizeConfig.blockSizeVertical * 5,
                  bottom: SizeConfig.blockSizeVertical * 2,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    String email = _emailcontroller.text;
                    if (email.isEmpty) {
                      CustomSnackBar.show(
                          context, "Please enter an email address");
                      return;
                    }

                    try {
                      await auth.sendPasswordResetEmail(email: email);
                      CustomSnackBar.show(context, "Password reset email sent");
                    } catch (e) {
                      CustomSnackBar.show(context, "Error: ${e.toString()}");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      fontFamily: "Audiowide",
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.safeBlockVertical * 5),
            ],
          ),
        ),
      ),
    );
  }
}
