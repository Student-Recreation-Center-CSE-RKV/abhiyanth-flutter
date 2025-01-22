import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:provider/provider.dart';
import '../services/custom_snackbar.dart';
import '../viewmodels/loginview_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  NavigationService navigationService=NavigationService();

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: ChangeNotifierProvider(
        create: (context) => LoginViewModel(),
        child: Consumer<LoginViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
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
                    // Title
                    Text(
                      "Abhiyanth 2k25",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "AudioWide",
                        fontSize: SizeConfig.blockSizeVertical * 3,
                      ),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 10),
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
                    // Subtitle
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
                      child: _buildTextField(
                        hintText: "Enter your email",
                        icon: Icons.email,
                        onChanged: viewModel.setEmail,
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2),
                    // Password TextField
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 5,
                      )      ,
                      child: _buildTextField(
                        hintText: "Enter your password",
                        icon: Icons.lock,
                        obscureText: _obscureText,
                        onChanged: viewModel.setPassword,
                        suffixIcon: IconButton(
                          onPressed: _toggleObscureText,
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 3),
                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        viewModel.login(context);
                        CustomSnackBar.show(context, "Logging in...");
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                          child: viewModel.isLoading
                              ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          )
                              : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                              SizeConfig.safeBlockHorizontal * 5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 1),
                    // Forgot Password
                    TextButton(
                      onPressed: () {
                        navigationService.pushScreen(RoutesName.forgotpass);
                      },
                      child: const Text(
                        'Forgot password',
                        style: TextStyle(color: Colors.blue, fontFamily: "Audiowide",),
                      ),
                    ),
                    // Register Now
                    Text.rich(
                      TextSpan(
                        text: "Don't have an account...?",
                        style: const TextStyle(color: Colors.white, fontFamily: "Audiowide",),
                        children: [
                          TextSpan(
                            text: 'Register Now',
                            style: const TextStyle(color: Colors.blue , fontFamily: "Audiowide",),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              navigationService.pushScreen(RoutesName.signup);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    required ValueChanged<String> onChanged,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.transparent),
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Color(0xFF6AE4FF), Color(0xFFFF6AB7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white70),
            border: InputBorder.none,
            prefixIcon: Icon(icon, color: Colors.white),
            suffixIcon: suffixIcon,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
