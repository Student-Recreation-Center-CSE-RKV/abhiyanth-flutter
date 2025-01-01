import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:provider/provider.dart';
import '../viewmodels/signupview_model.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize SizeConfig
    SizeConfig.init(context);

    return ChangeNotifierProvider(
      create: (context) => SignupViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Consumer<SignupViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  SizedBox(height: SizeConfig.safeBlockVertical * 0.5),
                  Image.asset(
                    'assets/images/Abhiyanthlogo2.png',
                    width: SizeConfig.safeBlockHorizontal * 40,
                    height: SizeConfig.safeBlockVertical * 40,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 0.1),
                  Image.asset(
                    'assets/images/loginpic.png',
                    fit: BoxFit.cover,
                    width: SizeConfig.safeBlockHorizontal * 50,
                    height: SizeConfig.safeBlockVertical * 25,
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 5),
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
                          controller: _emailController,
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
                          controller: _passwordController,
                          obscureText: viewModel.isLoading,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.lock, color: Colors.white),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  // SignUp Button
                  ElevatedButton(
                    onPressed: viewModel.isLoading
                        ? null
                        : () {
                      final email = _emailController.text.trim();
                      final password = _passwordController.text.trim();

                      if (email.isNotEmpty && password.isNotEmpty) {
                        viewModel.signup(email, password, context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill all fields')),
                        );
                      }
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
                        child: viewModel.isLoading
                            ? CircularProgressIndicator()
                            : Text(
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
                    TextSpan(
                      text: "Already have an account...?",
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, RoutesName.login);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

