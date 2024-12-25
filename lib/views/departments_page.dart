import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:flutter/material.dart';


class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({super.key});

  @override
  State<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
          body: Center(
            child: const Text(
              "Departments Page",
              style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
            ),
          ),
        );
  }
}
