import 'package:flutter/material.dart';
import 'package:abhiyanth/viewmodels/loginview_model.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginViewModel _viewModel = LoginViewModel();
  bool _obscuretext=true;
  void obscure(){
    setState(() {
      _obscuretext=!_obscuretext;
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Color(0xFFF1F6F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal! * 6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Logo
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.zero,

                  child: Image.asset(
                    'assets/images/LoginPic.png',
                    height: SizeConfig.safeBlockVertical! * 30,
                    width: SizeConfig.safeBlockHorizontal! * 70,
                    
                  ),
                ),

                SizedBox(height: 80),

                // Form widget to enable validation
                Form(
                  key: _formKey, // Assign the form key here
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.zero,
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
                          SizedBox(height: 16),

                          // Password Field
                          TextFormField(
                            initialValue: _viewModel.password,
                            validator: _viewModel.validatePassword,
                            obscureText: _obscuretext,
                            onChanged: (value) => _viewModel.setPassword(value),
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(onPressed: obscure, icon: _obscuretext==true?Icon(Icons.visibility_off):Icon(Icons.visibility)),
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
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              result["message"])),
                                    );
                                  }
                                  
                                   else {
                                    setState(() {});
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0A2647),
                                padding:
                                EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                "Login",
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

                          // Forgot Password
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xFF144272),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // Sign Up
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RoutesName.signup);
                            },
                            child: Text(
                              "Don't have an account? Sign Up",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
