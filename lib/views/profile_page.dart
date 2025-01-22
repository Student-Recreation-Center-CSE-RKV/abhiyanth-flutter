
import 'package:abhiyanth/widgets/gradient_border.dart';
import 'package:flutter/material.dart';
import '../services/size_config.dart';
import '../utilities/gradient_background.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> branches = ['CSE', 'ECE', 'EEE', 'Mechanical', 'Civil','Chemical','MME'];
  String selectedBranch = 'CSE';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return  GradientBackground(
    child:Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 5),
          child: Column(
            children: [
              const SizedBox(height: 20),
              BorderGradient(
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
                borderWidth: 3.0, // Border width
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.safeBlockVertical * 1.0,
                    horizontal: SizeConfig.safeBlockHorizontal * 15,
                  ), // Inner padding for the text
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: SizeConfig.blockSizeVertical * 10,
                    backgroundColor: Colors.purple,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildTextField("Name", "Melissa Peters"),
              const SizedBox(height: 15),
              _buildTextField("Email", "melpeters@gmail.com"),
              const SizedBox(height: 15),
              _buildTextField("Batch", "R20"),
              const SizedBox(height: 15),

              // Dropdown for Branch Selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Branch",
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 1),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<String>(
                      value: selectedBranch,
                      isExpanded: true,
                      dropdownColor: Colors.black,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                      underline: const SizedBox(),
                      items: branches.map((String branch) {
                        return DropdownMenuItem<String>(
                          value: branch,
                          child: Text(
                            branch,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBranch = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              _buildTextField("Mobile", "9966778899"),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 1.0,
                    horizontal: SizeConfig.blockSizeHorizontal * 10,
                  ),
                ),
                onPressed: () {

                },
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    )
    );
  }

  Widget _buildTextField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: SizeConfig.safeBlockHorizontal * 4,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: value,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}