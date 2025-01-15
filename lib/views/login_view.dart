import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:provider/provider.dart';
import '../viewmodels/loginview_model.dart';


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
      body: ChangeNotifierProvider(
        create: (context) => LoginViewModel(), // Provide the ViewModel
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.blockSizeVertical * 6),
                  // Logo Image
                  Image.asset(
                    'assets/images/Abhiyanthlogo2.png',
                    fit: BoxFit.cover,
                    width: SizeConfig.safeBlockHorizontal * 30,
                    height: SizeConfig.blockSizeVertical * 18,
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 2),
                  Text(
                    "Abhiyanth 2k25",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "AudioWide",
                      fontSize: SizeConfig.blockSizeVertical * 3,
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 15),
                  // Welcome Text
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'AudioWide',
                      fontSize: SizeConfig.safeBlockHorizontal * 8,
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 1),
                  // Subtitle Text
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
                      horizontal: SizeConfig.safeBlockHorizontal * 5,
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
                          onChanged: (value) {
                            viewModel.setEmail(value); // Update email
                          },
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
                      horizontal: SizeConfig.safeBlockHorizontal * 5,
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
                          colors: [Color(0xFF6AE4FF), Color(0xFFFF6AB7)],
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
                          obscureText: _obscuretext,
                          onChanged: (value) {
                            viewModel.setPassword(value); // Update password
                          },
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
                      viewModel.login(context); // Call the login method from ViewModel
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 2,
                        ),
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
                  SizedBox(height: SizeConfig.safeBlockVertical * 1),
                  // Forgot Password Button
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutesName.forgotpass);
                    },
                    child: const Text(
                      'Forgot password',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  // Register Now Link
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account...?",
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Register Now',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, RoutesName.signup);
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 4),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
