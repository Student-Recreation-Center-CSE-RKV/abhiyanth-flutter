import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscuretext = true;

  void _toggleObscureText() {
    setState(() {
      _obscuretext = !_obscuretext;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical*3,),
            Image.asset(
              'assets/images/Abhiyanthlogo2.png',
              width:SizeConfig.safeBlockHorizontal*40,
              height:SizeConfig.safeBlockVertical*40,
            ),

            Image.asset(
              'assets/images/loginpic.png',
              fit: BoxFit.cover,
              width: SizeConfig.safeBlockHorizontal * 50,
              height: SizeConfig.safeBlockVertical*25,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical *2),
            // Email TextField
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockHorizontal * 10),
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
                        SizeConfig.safeBlockHorizontal * 10),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 3),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            // Password TextField
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockHorizontal * 10),
                  gradient: LinearGradient(
                    colors: [Color(0xFF6AE4FF), Color(0xFFFF6AB7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal * 10),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.safeBlockHorizontal * 3),
                  child: TextFormField(
                    obscureText: _obscuretext,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      suffixIcon: IconButton(
                        onPressed: _toggleObscureText,
                        icon: Icon(
                          _obscuretext
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3),
            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RoutesName.home);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Signin successfully"),
                    duration: Duration(seconds: 2),
                  ),
                );

              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      SizeConfig.safeBlockHorizontal * 2),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 6,
                  vertical: SizeConfig.safeBlockVertical * 1.5,
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: SizeConfig.safeBlockVertical * 5,
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                    ),
                  ),
                ),
              ),
            ),
            Text.rich(
              TextSpan(text:"Already have an account...?",style:const TextStyle(color:Colors.white),
                  children:[
                    TextSpan(text: 'Login',style:const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle navigation to the registration page
                  Navigator.pushNamed(context, RoutesName.login);
                },
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
