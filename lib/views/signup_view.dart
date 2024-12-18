import 'package:flutter/material.dart';
import 'package:abhiyanth/viewmodels/signupview_model.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignupviewModel _viewModel = SignupviewModel();
  bool _obscuretext=true;
  void obscure(){
    setState(() {
      _obscuretext=!_obscuretext;
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Color(0xFFF1F6F9),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.safeBlockHorizontal! * 3,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Logo
                Image.asset(
                  'assets/images/SignupPic.png',
                  height: SizeConfig.safeBlockVertical! * 50,
                  width: SizeConfig.safeBlockHorizontal! * 70,
                ),

                SizedBox(height: 8),

                // Card Container
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Email Field
                        TextFormField(
                          initialValue: _viewModel.email,
                          validator: _viewModel.validateEmail,
                          onChanged: (value) => _viewModel.setEmail(value),
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            filled: true,
                            fillColor: Color(0xFFF1F6F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        // Password Field
                        TextFormField(
                          initialValue: _viewModel.password,
                          validator: _viewModel.validatePassword,
                          obscureText: _obscuretext,
                          onChanged: (value) => _viewModel.setPassword(value),
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(onPressed: obscure
                                , icon:_obscuretext==true?Icon(Icons.visibility_off):Icon(Icons.visibility) ),
                            filled: true,
                            fillColor: Color(0xFFF1F6F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Login Button
                        _viewModel.isLoading
                            ? CircularProgressIndicator()
                            : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final result = await _viewModel.submit();
                                if (result["success"]) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(result["message"])),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0A2647),
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),

                        // Error Message
                        if (_viewModel.errorMessage.isNotEmpty)
                          Text(
                            _viewModel.errorMessage,
                            style: TextStyle(color: Colors.red),
                          ),

                        // Sign Up
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RoutesName.login);
                          },
                          child: Text(
                            "Already have an account? Login",
                            style: TextStyle(
                              color: Color(0xFF144272),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
