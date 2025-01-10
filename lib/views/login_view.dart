import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

            Image.asset(
              'assets/images/Abhiyanthlogo2.png',
              width:SizeConfig.safeBlockHorizontal*40,
              height:SizeConfig.safeBlockVertical*40,
            ),

            Image.asset(
              'assets/images/loginpic.png',
              fit: BoxFit.cover,
              width: SizeConfig.safeBlockHorizontal * 40,
              height: SizeConfig.safeBlockVertical*20,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Text(
              "Welcome Back!",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'AudioWide',
                fontSize: SizeConfig.safeBlockHorizontal * 8,
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 1),
            Text(
              "Login to Continue...",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'AudioWide',
                fontSize: SizeConfig.safeBlockHorizontal * 6,
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3),
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
                    content: Text("Login successfully"),
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
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(onPressed: (){}, child: const Text('Forgot password',style: TextStyle(color:Colors.blue),)),
            Text.rich(
              TextSpan(text:"Don't have an account...?",style:const TextStyle(color:Colors.white),
              children:[
              TextSpan(text:'Register Now',style: const TextStyle(color:Colors.blue,),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle navigation to the registration page
                    Navigator.pushNamed(context, RoutesName.signup);
                  },
              )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
