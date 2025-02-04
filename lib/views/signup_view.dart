import 'package:abhiyanth/widgets/glowing_logo.dart';
import 'package:abhiyanth/widgets/grid_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/size_config.dart';
import '../services/Routes/navigation_service.dart';
import '../viewmodels/signupview_model.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  NavigationService navigationService = NavigationService();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return ChangeNotifierProvider(
      create: (context) => SignupViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Animated background
            Positioned.fill(
                child: Squares(
                    direction: 'diagonal',
                    borderColor: Colors.white,
                    squareSize: 30.0,
                    speed: 0.5)),

            // Content over the animated background
            Column(
              children: [
                Consumer<SignupViewModel>(
                  builder: (context, viewModel, child) {
                    return Column(
                      children: [
                        SizedBox(height: SizeConfig.safeBlockVertical * 0.5),
                        Image.asset(
                          'assets/images/Abhiyanthlogo2.png',
                          width: SizeConfig.safeBlockHorizontal * 45,
                          height: SizeConfig.safeBlockVertical * 45,
                        ),
                        Text(
                          "Welcome to ",
                          style: TextStyle(
                            fontFamily: "Audiowide",
                            color: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal * 7,
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                        Center(
                          child: Text(
                            "Abhiyanth 2k25",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Audiowide",
                              fontSize: SizeConfig.safeBlockHorizontal * 8,
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 6),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal * 80,
                          child: ElevatedButton(
                            onPressed: viewModel.isGoogleLoading
                                ? () {}
                                : () async {
                                    await viewModel.signupGoogle(context);
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
                                child: viewModel.isGoogleLoading
                                    ? SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: BlinkingLogo(),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Googlelogo.png',
                                            width:
                                                SizeConfig.safeBlockHorizontal *
                                                    8,
                                            height:
                                                SizeConfig.safeBlockVertical *
                                                    8,
                                          ),
                                          SizedBox(
                                              width: SizeConfig
                                                      .safeBlockHorizontal *
                                                  2),
                                          Text(
                                            "Continue with Google",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal *
                                                  4.5,
                                              fontFamily: "Audiowide",
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 2),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
