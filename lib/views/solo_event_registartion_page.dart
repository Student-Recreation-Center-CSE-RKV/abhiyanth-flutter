import 'package:abhiyanth/models/department_event_model.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/viewmodels/solo_event_registration_view_model.dart';
import 'package:abhiyanth/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class SoloEventRegistartionPage extends StatefulWidget {
  const SoloEventRegistartionPage({super.key, required this.event});

  final Event event;
  @override
  State<SoloEventRegistartionPage> createState() =>
      _SoloEventRegistartionPageState();
}

class _SoloEventRegistartionPageState extends State<SoloEventRegistartionPage> {
  late final SoloEventRegistrationViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = SoloEventRegistrationViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            leadingWidth: 60,
            backgroundColor: Colors.transparent,
            title: const Text(
              "Abhiyanth 2K25",
              style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                  child: BorderGradient(
                    borderWidth: 6.0,
                    gradientColors: const [
                      Color(0xFFFF6AB7),
                      Color(0xFF6AE4FF)
                    ],
                    borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal * 5),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 15,
                          vertical: SizeConfig.safeBlockVertical * 1.5),
                      child: Text(
                        widget.event.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Audiowide",
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Form(
                    key: _viewModel.formKey,
                    child: Padding(
                      padding:  EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
                      child: Column(
                        children: <Widget>[
                          _buildTextField(
                              hintText: "Enter your name",
                              controller: _viewModel.nameController,
                              title: "Name",
                          type: "text"),
                          _buildTextField(
                              hintText: "Enter your ID Number",
                              controller: _viewModel.idController,
                              title: "ID Number",
                            type: "text"
                          ),
                          _buildTextField(
                              hintText: "Enter your Email ID",
                              controller: _viewModel.emailController,
                              title: "Email",
                              type: "email"
                          ),
                          _buildTextField(
                              hintText: "Enter your Contact Number",
                              controller: _viewModel.contactNumberController,
                              title: "Contact Number",
                          type: "phone"
                          ),
                          _buildTextField(
                            value: '${widget.event.registrationFee} Rs.',
                              title: "Registration Fee",
                            readOnly: true
                          )
                        ],
                      ),
                    )),
                TextButton(
                  onPressed: () {
                    _viewModel.onSubmit();                          // navigationService.pushScreen(RoutesName.showEvent,arguments: event);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFFF3366),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 2.5),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 1,
                      horizontal: SizeConfig.blockSizeHorizontal * 5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Ensures the row takes only as much space as needed
                    children: [
                      Text(
                        "Register Now",
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 4,
                          fontFamily: "Audiowide",
                        ),
                      ),
                    ],
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

Widget _buildTextField({
   String? title,
   String? hintText,
   TextEditingController? controller,
   String ?type,
  bool ?readOnly=false,
  String ?value="",
}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left:SizeConfig.safeBlockHorizontal * 2),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title!,
            style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
          ),
        ),
      ),

      Container(
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
            initialValue: value,
            onChanged: (value){
              controller?.text=value;
            },
            readOnly: readOnly!,
            keyboardType :type == "phone"? TextInputType.phone: type == "email"? TextInputType.emailAddress : TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Colors.white70, fontFamily: "Audiowide"),
              border: InputBorder.none,
            ),
            style:
                const TextStyle(color: Colors.white, fontFamily: "Audiowide"),
          ),
        ),
      ),
      SizedBox(
        height: SizeConfig.safeBlockVertical * 2,
      ),
    ],
  );
}
