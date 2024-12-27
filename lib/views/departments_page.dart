import 'package:abhiyanth/utilities/gradient_background.dart'; // Ensure this file exists and is correctly implemented // Ensure this file exists and contains the BorderGradient widget.
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/widgets/gradient_border.dart';

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({super.key});

  @override
  State<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  final List<Map<String, String>> departments = [
    {"code": "CSE", "name": "Aadhya"},
    {"code": "ECE", "name": "Technothon"},
    {"code": "ME", "name": "Mechanza"},
    {"code": "Civil", "name": "Civiclan"},
    {"code": "MME", "name": "Dhatukriya"},
    {"code": "CE", "name": "Enrich"},
    {"code": "EEE", "name": "Ecnovation"},
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: GradientBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                child: BorderGradient(
                  borderWidth: 6.0,
                  gradientColors: const [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
                  borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 20),
                    child: Text(
                      "Departments",
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
              Expanded(
                child: ListView.builder(
                  itemCount: departments.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal * 5,
                        vertical: SizeConfig.safeBlockVertical * 1.5,
                      ),
                      child: BorderGradient(
                        borderWidth: 4.0,
                        gradientColors: const [Color(0xFF6AE4FF), Color(0xFFFF6AB7)],
                        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 4),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 3,
                            vertical: SizeConfig.safeBlockVertical * 1,
                          ),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                departments[index]["code"]!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Audiowide",
                                  fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                                ),
                              ),
                              Container(
                                width: 2, // Width of the vertical line
                                height: SizeConfig.safeBlockVertical * 3, // Adjust height
                                color: Colors.white, // Line color
                                margin: EdgeInsets.symmetric(horizontal: 12.0), // Spacing around the line
                              ),
                              Text(
                                departments[index]["name"]!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Audiowide",
                                  fontSize: SizeConfig.safeBlockHorizontal*3.5,
                                ),
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                          onTap: () {
                            // Handle department item click here
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
