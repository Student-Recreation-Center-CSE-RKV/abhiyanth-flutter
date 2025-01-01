import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import '../services/size_config.dart';
class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailcontroller=TextEditingController();
  final auth=FirebaseAuth.instance;
   @override
  Widget build(BuildContext context) {
    return GradientBackground (
    child:Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
                  Padding(
                            padding: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.safeBlockHorizontal * 5,
                                        vertical: SizeConfig.blockSizeVertical*15
                                      ),
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
                                        child: Container(
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
                                      ),
                                    ),
              SizedBox(height: SizeConfig.safeBlockVertical*10,),
            ElevatedButton(
               onPressed: () async {
                               String email = _emailcontroller.text;
                               if (email.isEmpty) {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(content: Text("Please enter an email address")),
                                 );
                                 return;
                               }

                               try {
                                 await auth.sendPasswordResetEmail(email: email);
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(content: Text("Password reset email sent")),
                                 );
                               } catch (e) {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(content: Text("Error: ${e.toString()}")),
                                 );
                               }
                             },
    child: Text("Reset",style: TextStyle(color: Colors.white,fontSize: SizeConfig.safeBlockHorizontal*3),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            ),

        ],
      ),
    ),
    );
  }
}