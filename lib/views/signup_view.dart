import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:provider/provider.dart';
import '../services/Routes/navigation_service.dart';
import '../services/Routes/routes.dart';
import '../services/custom_snackbar.dart';
import '../services/user_service.dart';
import '../viewmodels/signupview_model.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  bool _obscuretext = true;

  NavigationService navigationService=NavigationService();

  void _toggleObscureText() {
    setState(() {
      _obscuretext = !_obscuretext;
    });
  }

  @override
  Widget build(BuildContext context) {

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
                    width: SizeConfig.safeBlockHorizontal * 50,
                    height: SizeConfig.safeBlockVertical * 50,
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
                          controller: viewModel.emailController,
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
                          controller: viewModel.passwordController,

                          obscureText: _obscuretext,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            hintStyle: const TextStyle(color: Colors.white70),
                            border: InputBorder.none,
                            prefixIcon: const Icon(Icons.lock, color: Colors.white),
                            suffixIcon: IconButton(onPressed: _toggleObscureText, icon: Icon(_obscuretext?Icons.visibility:Icons.visibility_off),)
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
                      final email = viewModel.emailController.text.trim();
                      final password = viewModel.passwordController.text.trim();

                      if (email.isNotEmpty && password.isNotEmpty) {
                        viewModel.signup(email, password, context);
                      } else {
                       CustomSnackBar.show(context, 'Please fill all fields');
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
                  SizedBox(height: SizeConfig.safeBlockVertical * 2),
                  // Continue with Google Button
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 80,
                    child: ElevatedButton(
                      onPressed: () async {
                        final userService = UserService();

                        final user = await userService.signInWithGoogle();

                        if (user != null) {
                          print('User signed in with Google: ${user.displayName}');
                         navigationService.removeAllAndPush(RoutesName.home,RoutesName.signup);
                        } else {
                          CustomSnackBar.show(context, 'Google Sign-In failed');                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 3,
                          vertical: SizeConfig.safeBlockVertical * 1,
                        ),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: SizeConfig.safeBlockVertical * 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Googlelogo.png',
                                width: SizeConfig.safeBlockHorizontal * 8,
                                height: SizeConfig.safeBlockVertical * 8,
                              ),
                              SizedBox(width: SizeConfig.safeBlockHorizontal * 2),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: SizeConfig.safeBlockVertical * 2),
                  // Login Link
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
                              navigationService.pushScreen(RoutesName.login);
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
