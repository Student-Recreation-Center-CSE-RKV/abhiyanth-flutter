import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/widgets/gradient_border.dart';

import '../../services/Routes/navigation_service.dart';
import '../../services/Routes/routesname.dart';

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({super.key});

  @override
  State<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  NavigationService navigationService=NavigationService();
  final List<Map<String, String>> departments = [
    {"code": "CSE", "name": "Aadhya"},
    {"code": "ECE", "name": "Technothon"},
    {"code": "ME", "name": "Mechanza"},
    {"code": "Civil", "name": "Civiclan"},
    {"code": "MME", "name": "Dhatukriya"},
    {"code": "CE", "name": "Enrich"},
    {"code": "EEE", "name": "Ecnovation"},
  ];
  void navigateToPage(String page) {
    // Perform navigation based on the page name
    switch (page) {
      case 'CSE':
        navigationService.pushScreen(RoutesName.cse);
        break;
      case 'ECE':
        navigationService.pushScreen(RoutesName.ece);
        break;
      case 'ME':
        navigationService.pushScreen(RoutesName.mech);
        break;
      case 'Civil':
        navigationService.pushScreen(RoutesName.civil);
        break;
      case 'MME':
        navigationService.pushScreen(RoutesName.mme);
        break;
      case 'CE':
        navigationService.pushScreen(RoutesName.chemical);
        break;
      case 'EEE':
        navigationService.pushScreen(RoutesName.eee);
        break;
      default:
        break;
    }
  }

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
                            navigateToPage(departments[index]["code"]!);
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
